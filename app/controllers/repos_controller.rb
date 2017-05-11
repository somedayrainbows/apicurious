class ReposController < ApplicationController

  def index
    @repos = GithubRepo.all(current_user.oauth_token)
  end

end
