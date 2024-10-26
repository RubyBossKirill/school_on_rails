# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, opts = {})
    if resource.persisted?
      token = request.env['warden-jwt-_auth.token']
      headers['Authorization'] = token
      data = UserSerializer.new(resource).serializable_hash[:data][:attributes]

      render json: {
        status: {
          code: 200, message: 'Signed up success',
          token:,
          data:
        }
      }
    else
      render json: {
        status: {
          message: "User couldnt be created. Signed up failure. #{resource.errors.full_message.to_sentence}"
        }
      }, status: :unprocessable_entity
    end
  end
end
