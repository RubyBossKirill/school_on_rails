class Api::V1::CategoriesController < ApplicationController
  before_action :authenticate_user!, only: %i[show destroy create update]
  before_action :find_category, only: %i[show destroy update]

  def show
    render json: {
      status: {
        message: 'Category were successfully show.',
        category: @category
      }
    }, status: :ok
  end

  def create
    outcome = Categories::Create.run(params.merge!(user_id: current_user.id.to_s))
    if outcome.errors.present?
      render json: {
        status: {
          message: "Category was failure created. #{outcome.errors.full_messages.join(', ')}"
        }
      }, status: :unprocessable_entity
    else
      render json: {
        status: {
          message: 'Category was successfully created.',
          category_id: outcome.result.id
        }
      }, status: :ok
    end
  end

  def index
    outcome = Categories::Index.run
    if outcome.errors.present?
      render json: {
        status: {
          message: "Category fetching failed. #{outcome.errors.full_messages.join(', ')}"
        }
      }, status: :unprocessable_entity
    else
      render json: {
        status: {
          message: 'Category were successfully fetched.',
          events: outcome.result
        }
      }, status: :ok
    end
  end

  def update
    outcome = Categories::Update.run(params.merge!(category: @category))
    if outcome.errors.present?
      render json: {
        status: {
          message: "Category was failure update. #{outcome.errors.full_messages.join(', ')}"
        }
      }, status: :unprocessable_entity
    else
      render json: {
        status: {
          message: "Category #{@category.id} was update",
          category: outcome.result
        }
      }, status: :ok
    end
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
    # в этом методе рендерить ошибки с интерактора
  end
end
