class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])

    devise_parameter_sanitizer.permit(:account_update, keys: %i[name])
  end

  # todo
  def render_resource_errors(resource, status: :unprocessable_entity)
    result = resource.errors.attribute_names.map do |attr|
      { key: attr, messages: resource.errors.full_messages_for(attr) }
    end
    render_errors(errors: result, status:)
  end

  def render_errors(errors: [], status: :unprocessable_entity)
    render json: { success: false, errors: }, status:
  end
end
