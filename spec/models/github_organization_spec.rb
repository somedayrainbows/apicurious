require 'rails_helper'

describe GithubOrganization do
  it "returns all orgs for a user" do
    VCR.use_cassette('organizations', record: :new_episodes) do
      orgs = GithubOrganization.all(ENV['github_user_token'])
      org = orgs.first

      expect(orgs.count).to eq(2)
      expect(org.name).to eq("errrrrrrrrrin")
    end
  end
end
