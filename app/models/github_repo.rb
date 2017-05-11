class GithubRepo
  attr_reader :name, :service

  def initialize(repo)
    @name = repo[:name]
  end

  def self.all(token)
    GithubService.new(token).repos.map { |repo| GithubRepo.new(repo) }
    #returns an array of hashes so we have to turn each hash into an object
  end

  def self.service(token)
    @service ||= GithubService.new(token)
  end

  def self.starred(token)
    GithubService.new(token).starred
    # should return an array of repos that are starred
  end

end
