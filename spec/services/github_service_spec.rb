require 'rails_helper'

describe GithubService do
  it "returns an array of hashes with repo data" do
    VCR.use_cassette('services/github_service', record: :new_episodes) do
      @service = GithubService.new(ENV['github_user_token'])
      repos = @service.repos

      expect(repos.count).to eq(30)
      expect(repos.first[:name]).to be_a(String)
      expect(repos).to be_an(Array)
      expect(repos.first).to be_a(Hash)
      expect(repos.first[:owner]).to be_a(Hash)
    end
  end



  end




  # context ".users_by(filter)" do
  #   it "returns "
  # end
