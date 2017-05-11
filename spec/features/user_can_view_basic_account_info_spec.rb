require 'rails_helper'

RSpec.feature "when logged in" do
  scenario "user can view basic account info" do
    stub_omniauth
    visit root_path
    click_link('Login')

    # write following into css section
    expect(page.status_code).to eq(200)
    expect(current_path).to eq(user_path)
    expect(stub_omniauth.info.name).to eq("Erin Bassity")
    expect(page).to have_content("Erin Bassity")
    expect(stub_omniauth.info.nickname).to eq("somedayrainbows")
    expect(page).to have_content("somedayrainbows")
  end
end
#
# View basic information about my account (profile pic, number of starred repos, followers, following)
