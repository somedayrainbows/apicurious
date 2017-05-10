class SessionsController < ApplicationController

  def create
    user = User.find_or_create_by(provider: auth_hash[:provider], uid: auth_hash[:uid]) do |user|
      user.name = auth_hash[:info][:name]
    end
    session[:user_id] = user.id

    # if user = User.from_omniauth(auth_hash)
    #   session[:user_id] = user.id
    # end
    redirect_to root_path, notice: "Logged in successfully!"
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
