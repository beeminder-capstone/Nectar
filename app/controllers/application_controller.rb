=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :user_signed_in?
  
  helper_method def providers
    @_providers ||= PROVIDERS.map do |name, provider|
      ProviderDecorator.new(provider, credentials[name])
    end
  end
  
  helper_method def credentials
    @_credentials ||= Array(current_user&.credentials).map do |c|
      [c.provider_name, c]
    end.to_h.with_indifferent_access
  end

  private

  def current_user
    @current_user ||= User.find_by beeminder_user_id: session[:beeminder_user_id]
  end

  def user_signed_in?
    !!current_user
  end

  def authenticate_user!
    return if current_user
    redirect_to root_url, alert: "Please log in with your Beeminder account first to access this page."
  end
end
