# frozen_string_literal: true

class Events::Posts::Create < ActiveInteraction::Base # rubocop:disable Style/ClassAndModuleChildren
  def execute # rubocop:disable Metrics/MethodLength
    event = Event.new(event_params)

    if event.save
      render json: {
        status: {
          message: 'Event was successfully created.'
        }
      }, status: :ok
    else
      render json: {
        status: {
          message: 'Event was failure created.'
        }
      }, status: :unprocessable_entity
    end
  end
end
