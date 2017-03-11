class Api::V1::BaseController < ApplicationController

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :destroy_session
  before_action :authenticate, except: [:secret_key]

  rescue_from ActiveRecord::RecordNotFound, with: :not_found!

  protected

  def authenticate
	unless ActiveSupport::SecurityUtils.secure_compare(Rails.application.secrets.secret_key_base, params[:secret_key])
      unauthenticated!
	end
  end

  def destroy_session
    request.session_options[:skip] = true
  end

  def unauthenticated!
    render json: { error: 'Bad credentials' }, status: 401
  end

  def invalid_resource!(errors = [])
    api_error(status: 422, errors: errors)
  end

  def not_found!
    return api_error(status: 404, errors: 'Not found')
  end

  def api_error(status: 500, errors: [])
    unless Rails.env.production?
      puts errors.full_messages if errors.respond_to? :full_messages
    end
    head status: status and return if errors.empty?

    render json: jsonapi_format(errors).to_json, status: status
  end
end
