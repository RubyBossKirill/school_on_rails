class EventsController < ApplicationController
  # :name, :description, :price, :category, :organization
  def index
  end

  def new
  end

  def create
    outcome = params.require(:event).permit(:name, :description, :price, :category, :organization)
    event = Events::Posts::Create.run(outcome)
    if event.errors.any?
      render json: {
        status: {
          message: "Event was failure created. #{event.errors.full_messages.join(', ')}"
        }
      }, status: :unprocessable_entity
    else
      render json: {
        status: {
          message: 'Event was successfully created.',
          event_id: event.result.id
        }
      }, status: :ok
    end
  end

  def edit
  end

  def show
  end

  def delete
  end
end
