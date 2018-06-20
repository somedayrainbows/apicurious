require 'rails_helper'

RSpec.feature "user can log in" do
  scenario "with github credentials" do
    VCR.use_cassette("login_github", record: :new_episodes) do
      stub_omniauth
      visit root_path
      click_link('Login')

      expect(page.status_code).to eq(200)
      # assert_equal 200, page.status_code
      expect(current_path).to eq(user_path)
      expect(page).to have_content("Logged in successfully!")
      expect(page).to have_link("Logout")
      expect(page).to have_content("Welcome, Erin Bassity")
    end
  end
end
