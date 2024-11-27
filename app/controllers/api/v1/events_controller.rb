class Api::V1::EventsController < ApplicationController
  # :name, :description, :price, :category, :organization
  # todo blueprint create and all
  before_action :authenticate_user!, only: %i[show destroy create]
  def index
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
    outcome = Events::Create.run(params)
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
    outcome = Events::Show.run(params)
    if outcome.errors.present?
      render json: {
        status: {
          message: "Event was failure show. #{outcome.errors.full_messages.join(', ')}"
        }
      }, status: :unprocessable_entity
    else
      render json: {
        status: {
          message: 'Event were successfully show.',
          event: outcome.result
        }
      }, status: :ok
    end
  end

  def destroy
    outcome = Events::Destroy.run(params)
    if outcome.errors.present?
      render json: {
        status: {
          message: "Event #{params[:id]} was failure destroy. #{outcome.errors.full_messages.join(', ')}"
        }
      }, status: :unprocessable_entity
    else
      render json: {
        status: {
          message: "Event #{params[:id]} was successfully destroy."
        }
      }, status: :ok
    end
  end
end
