=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end
class SessionsController < ApplicationController
  def new
    redirect_to "/auth/beeminder"
  end

  def create
    auth = request.env.fetch "omniauth.auth"
    credential = IdentityResolver.new(current_user, auth).credential

    if credential
      session[:beeminder_user_id] = credential.user.beeminder_user_id
      flash = "Logged in successfully!"
    else
      flash = "Please log in with your Beeminder account first."
    end
    redirect_to "/credentials/#{credential.provider.name}", notice: flash
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "Logged out successfully."
  end

  def failure
    redirect_to root_url, alert: "Authentication error: #{params[:message].humanize}"
  end
end
