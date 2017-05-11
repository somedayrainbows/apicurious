class GithubRepo
  attr_reader :name, :service

  def initialize(repo)
    @name = repo[:name]
  end

  def self.all(token)
    GithubService.new(token).repos.map { |repo| GithubRepo.new(repo) }
    #returns an array of hashes so we have to turn each hash into an object
  end

  def self.service
    @service ||= GithubService.new(token)
  end

end
