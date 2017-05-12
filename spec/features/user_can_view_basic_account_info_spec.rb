require 'rails_helper'

RSpec.feature "when logged in" do
  scenario "user can view basic account info" do
    VCR.use_cassette("profile_view", record: :new_episodes) do
      stub_omniauth
      visit root_path
      click_link('Login with Github')

      expect(page.status_code).to eq(200)
      expect(current_path).to eq(user_path)
      expect(stub_omniauth.info.name).to eq("Erin Bassity")
      expect(page).to have_content("Erin Bassity")
      expect(stub_omniauth.info.nickname).to eq("somedayrainbows")
      expect(page).to have_css("img[src*='https://avatars2.githubusercontent.com/u/#{stub_omniauth.uid}']")
      within("#profile") do
        expect(page).to have_content("Welcome, Erin Bassity!")
        expect(page).to have_content("somedayrainbows")
        expect(page).to have_content("You have 7 followers.")
        expect(page).to have_content("You are following 5 other users.")
      end
      within("#repo") do
        expect(page).to have_content("Starred: 1")
        expect(page).to have_content("Total: 30")
      end
      within("#orgs") do
        expect(page).to have_content("errrrrrrrrrin")
        expect(page).to have_content("maybewecanhavegoats")
      end
      # within("#feeds") do
      #   expect(page).to have_content("")
      #   expect(page).to have_content("")
      # end
  end
end



    # https://api.github.com/user/starred{/owner}{/repo}

    # number of starred repos, followers, following
end
#
