class EventsController < ApplicationController
  before_action :event_params, only: %i[index show new create]
  def index
  end

  def new
  end

  def create
    Events::Posts::Create.run(event_params)
  end

  def edit
  end

  def show
  end

  def delete
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :price, :category, :organization)
  end
end
