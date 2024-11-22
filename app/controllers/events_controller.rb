class EventsController < ApplicationController
  # :name, :description, :price, :category, :organization
  # todo blueprint create and all
  before_action :authorize_user!, only: %i[show destroy create]
  def index
    outcome = Events::Index.run(params)
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
          events: outcome.result.map do |event|
            { id: event.id, name: event.name, description: event.description, price: event.price,
              category: event.category, organization: event.organization }
          end
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
          message: 'Events were successfully show.',
          events: outcome.result.map do |event|
            { id: event.id, name: event.name, description: event.description, price: event.price,
              category: event.category, organization: event.organization }
          end
        }
      }, status: :ok
    end
  end

  def destroy
  end
end
