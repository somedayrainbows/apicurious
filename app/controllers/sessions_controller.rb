class SessionsController < ApplicationController

  def create
    if user = User.from_omniauth(auth_hash)
      session[:user_id] = user.id
    end
      redirect_to user_path, notice: "Logged in successfully!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You have successfully logged out."
  end

  private
  def auth_hash
    request.env["omniauth.auth"]
  end

end
