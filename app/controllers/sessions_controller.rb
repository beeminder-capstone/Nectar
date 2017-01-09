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
    redirect_to root_url, notice: flash
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "Logged out successfully."
  end

  def failure
    redirect_to root_url, alert: "Authentication error: #{params[:message].humanize}"
  end
end
