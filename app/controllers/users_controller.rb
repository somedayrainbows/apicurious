class UsersController < ApplicationController

  def show
    @repo_count = GithubRepo.starred(current_user.oauth_token).count
    @repos = GithubRepo.all(current_user.oauth_token)
    @followers = GithubUser.followers(current_user.oauth_token).count
    @following = GithubUser.following(current_user.oauth_token).count
    @orgs = GithubOrganization.all(current_user.oauth_token)
    # byebug
  end

end
