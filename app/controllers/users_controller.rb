class UsersController < ApplicationController

  def show
    @repo_count = GithubRepo.starred(current_user.oauth_token).count
    @repos = GithubRepo.all(current_user.oauth_token)
    @followers = GithubUser.followers(current_user.oauth_token).count
    @following = GithubUser.following(current_user.oauth_token).count
    @orgs = GithubOrganization.all(current_user.oauth_token)
    # byebug
  end

  def create
    if @user.save
      UserMailer.welcome_email(@user).deliver_now
      format.html { redirect_to(@user, notice: 'User was successfully created.') }
      format.json { render json: @user, status: :created, location: @user }
    else
      format.html { render action: 'new' }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end

end
