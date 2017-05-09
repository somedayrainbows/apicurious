require 'rails_helper'

RSpec.feature "user can log in" do
  scenario "with github credentials" do
    stub_omniauth
  end
end
