require 'rails_helper'

describe GithubOrganization do
  it "returns all orgs for a user" do
    VCR.use_cassette('organizations', record: :new_episodes) do
      orgs = GithubOrganization.all(ENV['github_user_token'])
      org1 = orgs.first
      org2 = orgs.last

      expect(orgs.count).to eq(2)
      expect(org1.name).to eq("errrrrrrrrrin")
      expect(org2.name).to eq("maybewecanhavegoats")
    end
  end
end
