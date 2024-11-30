class Api::V1::EventsController < ApplicationController
  # :name, :description, :price, :category, :organization
  # todo blueprint create and all
  before_action :authenticate_user!, only: %i[show destroy create update]
  before_action :find_event, only: %i[show destroy update]

  def index # rubocop:disable Metrics/MethodLength
    outcome = Events::Index.run
    if outcome.errors.present?
      render json: {
        status: {
          message: "Events fetching failed. #{outcome.errors.full_messages.join(', ')}"
        }
      }, status: :unprocessable_entity
    else
      render json: {
        status: {
          message: 'Events were successfully fetched.',
          events: outcome.result
        }
      }, status: :ok
    end
  end

  def create # rubocop:disable Metrics/MethodLength
    outcome = Events::Create.run(params.merge!(user_id: current_user.id.to_s))
    if outcome.errors.present?
      render json: {
        status: {
          message: "Event was failure created. #{outcome.errors.full_messages.join(', ')}"
        }
      }, status: :unprocessable_entity
    else
      render json: {
        status: {
          message: 'Event was successfully created.',
          event_id: outcome.result.id
        }
      }, status: :ok
    end
  end

  def show
    render json: {
      status: {
        message: 'Event were successfully show.',
        event: @event
      }
    }, status: :ok
  end

  def destroy
    @event.destroy
    render json: {
      status: {
        message: "Event #{params[:id]} was successfully destroy."
      }
    }, status: :ok
  end

  def update
    outcome = Events::Update.run(params.merge!(event: @event))
    if outcome.errors.present?
      render json: {
        status: {
          message: "Event was failure update. #{outcome.errors.full_messages.join(', ')}"
        }
      }, status: :unprocessable_entity
    else
      render json: {
        status: {
          message: "Event #{@event.id} was update",
          event: outcome.result
        }
      }, status: :ok
    end
  end

  def by_category
    outcome = Events::ByCategory.run(params)
    if outcome.errors.present?
      render json: {
        status: {
          message: "Event was failure by category. #{outcome.errors.full_messages.join(', ')}"
        }
      }, status: :unprocessable_entity
    else
      render json: {
        status: {
          message: 'Events success by category',
          events: outcome.result
        }
      }, status: :ok
    end
  end

  def by_date
    outcome = Events::ByDate.run(params)
    if outcome.errors.present?
      render json: {
        status: {
          message: "Event was failure by category. #{outcome.errors.full_messages.join(', ')}"
        }
      }, status: :unprocessable_entity
    else
      render json: {
        status: {
          message: 'Events success by category',
          events: outcome.result
        }
      }, status: :ok
    end
  end

  private

  def find_event
    @event = Events::FindEvent.run!(params)
    # в этом методе рендерить ошибки с интерактора
  end
end
