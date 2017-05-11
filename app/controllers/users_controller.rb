class UsersController < ApplicationController

  def show
    @repo_count = GithubRepo.starred(current_user.oauth_token).count
    @repos = GithubRepo.all(current_user.oauth_token)
  end

end
