require 'rails_helper'

RSpec.feature "user can log in" do
  scenario "with github credentials" do
    stub_omniauth

    visit root_path
    click_link('Login')

    expect(page.status_code).to eq(200)
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Logged in successfully!")
    expect(page).to have_link("Logout")
    expect(page).to have_content("Welcome, Erin")
  end
end
