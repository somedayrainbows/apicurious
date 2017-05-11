require 'rails_helper'

describe "when logged in" do
  xit "user can view repo data" do
    VCR.use_cassette("repo_view") do
      stub_omniauth
      visit root_path
      click_link('Login')

      visit('/user/repos')

      expect(current_path).to eq('/user/repos')
      expect(page).to have_content("ralesengine")
      expect(page).to have_content("career-development-curriculum")

    #check for css class and check for # repos, etc.
    end
  end
end

# get '/repos/{user}/{repo}'
#
# @repos = GithubUser.new(current_user.token).repos
