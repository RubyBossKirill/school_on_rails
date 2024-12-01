class Api::V1::CategoriesController < ApplicationController
  before_action :authenticate_user!, only: %i[show destroy create update]
  before_action :find_category, only: %i[show destroy update]

  def show
    render json: { 'success' => true,
                   'result': CategoryBlueprint.render(@category, view: :base) },
           status: :ok
  end

  def create
    outcome = Categories::Create.run(params.merge!(user_id: current_user.id.to_s))
    render_resource_errors(outcome) if outcome.errors.present?
    render json: { 'success' => true,
                   'result': CategoryBlueprint.render(outcome, view: :base) },
           status: :ok
  end

  def index
    outcome = Categories::Index.run
    render_resource_errors(outcome) if outcome.errors.present?
    render json: { 'success' => true,
                   'result': CategoryBlueprint.render(outcome, view: :base) },
           status: :ok
  end

  def update
    outcome = Categories::Update.run(params.merge!(category: @category))
    render_resource_errors(outcome) if outcome.errors.present?
    render json: { 'success' => true,
                   'result': CategoryBlueprint.render(outcome, view: :base) },
           status: :ok
  end

  def destroy
    @category.destroy
    render json: {
      status: {
        message: "Category #{params[:id]} was successfully destroy."
      }
    }, status: :ok
  end

  private

  def find_category
    @category = Categories::FindCategory.run!(params)

    render_resource_errors(@category) if @category.errors.present?
  end
end
