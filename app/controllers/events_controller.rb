class EventsController < ApplicationController
  # :name, :description, :price, :category, :organization
  # todo blueprint create and all
  before_action :authorize_user!, only: %i[show destroy create]
  def index
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
  end

  def destroy
  end
end
