class Api::V1::EventsController < ApplicationController
  # :name, :description, :price, :category, :organization
  # todo blueprint create and all
  before_action :authenticate_user!, only: %i[show destroy create update]
  before_action :find_event, only: %i[show destroy update]

  def index
    outcome = Events::Index.run
    render_resource_errors(outcome) if outcome.errors.present?
    render json: { 'success' => true,
                   'result': EventBlueprint.render(outcome.result, view: :base) },
           status: :ok
  end

  def create
    outcome = Events::Create.run(params.merge!(user_id: current_user.id.to_s))
    render_resource_errors(outcome) if outcome.errors.present?
    render json: { 'success' => true,
                   'result': EventBlueprint.render(outcome.result, view: :base) },
           status: :ok
  end

  def show
    render json: { 'success' => true,
                   'result': EventBlueprint.render(@event, view: :base) },
           status: :ok
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
    render_resource_errors(outcome) if outcome.errors.present?
    render json: { 'success' => true,
                   'result': EventBlueprint.render(outcome.result, view: :base) },
           status: :ok
  end

  def by_category
    outcome = Events::ByCategory.run(params)
    render_resource_errors(outcome) if outcome.errors.present?
    render json: { 'success' => true,
                   'result': EventBlueprint.render(outcome.result, view: :base) },
           status: :ok
  end

  def by_date
    outcome = Events::ByDate.run(params)
    render_resource_errors(outcome) if outcome.errors.present?
    render json: { 'success' => true,
                   'result': EventBlueprint.render(outcome.result, view: :base) },
           status: :ok
  end

  private

  def find_event
    @event = Events::FindEvent.run!(params)

    render_resource_errors(@event) if @event.errors.present?
  end
end
