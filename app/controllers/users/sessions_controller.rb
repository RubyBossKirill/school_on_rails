# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController # rubocop:disable Style/Documentation,Style/ClassAndModuleChildren
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    token = request.env['warden-jwt_auth.token']
    headers['Authorization'] = token
    user = UserSerializer.new(resource).serializable_hash[:data][:attributes]

    render json: {
      status: {
        message: 'Logged is success',
        token:,
        data: { user: }
      }
    }, status: :ok
  end

  def respond_to_on_destroy
    auth_token = request.headers['Authorization']
    if auth_token.present?
      jwt_payload = JWT.decode(auth_token.split.last,
                               Rails.application.credentials.devise_jwt_secret_key!).first

      current_user = User.fing(jwt_payload['sub'])
    end

    if current_user
      render json: {
        status: 200,
        message: 'Logged out success'
      }, status: :ok
    else
      render json: {
        status: 401,
        message: 'Logged out failure'
      }, status: :unauthorized
    end
  end
end
