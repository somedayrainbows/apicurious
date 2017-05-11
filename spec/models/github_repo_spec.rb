require 'rails_helper'

describe GithubRepo do
  it "returns all repos" do
    VCR.use_cassette('repos/all', record: :new_episodes) do
      repos = GithubRepo.all(ENV['github_user_token'])
      repo = repos.first

      expect(repos.count).to eq(30)
      expect(repo.name).to eq("knight_rider")
    end
  end
end
