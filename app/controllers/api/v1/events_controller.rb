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
          message: 'Events fetching failed.',
          errors: render_resource_errors(outcome)
        }
      }, status: :unprocessable_entity
    else
      render json: { 'success' => true,
                     'result': EventBlueprint.render(outcome.result, view: :base) },
             status: :ok
    end
  end

  def create # rubocop:disable Metrics/MethodLength
    outcome = Events::Create.run(params.merge!(user_id: current_user.id.to_s))
    if outcome.errors.present?
      render json: {
        status: {
          message: 'Event was failure created.',
          errors: render_resource_errors(outcome)
        }
      }, status: :unprocessable_entity
    else
      render json: { 'success' => true,
                     'result': EventBlueprint.render(outcome.result, view: :base) },
             status: :ok
    end
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
    if outcome.errors.present?
      render json: {
        status: {
          message: 'Event was failure update.',
          errors: render_resource_errors(outcome)
        }
      }, status: :unprocessable_entity
    else
      render json: { 'success' => true,
                     'result': EventBlueprint.render(outcome.result, view: :base) },
             status: :ok
    end
  end

  def by_category
    outcome = Events::ByCategory.run(params)
    if outcome.errors.present?
      render json: {
        status: {
          message: 'Event was failure by category.',
          errors: render_resource_errors(outcome)
        }
      }, status: :unprocessable_entity
    else
      render json: { 'success' => true,
                     'result': EventBlueprint.render(outcome.result, view: :base) },
             status: :ok
    end
  end

  def by_date
    outcome = Events::ByDate.run(params)
    if outcome.errors.present?
      render json: {
        status: {
          message: 'Event was failure by date.',
          errors: render_resource_errors(outcome)
        }
      }, status: :unprocessable_entity
    else
      render json: { 'success' => true,
                     'result': EventBlueprint.render(outcome.result, view: :base) },
             status: :ok
    end
  end

  private

  def find_event
    @event = Events::FindEvent.run!(params)

    if @event.errors.present? # rubocop:disable Style/GuardClause
      render json: {
        status: {
          message: 'Find event not found',
          errors: render_resource_errors(@event)
        }
      }, status: :unprocessable_entity
    end
  end
end
