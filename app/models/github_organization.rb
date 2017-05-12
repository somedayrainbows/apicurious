class GithubOrganization
  attr_reader :name

  def initialize(org)
    @name = org[:login]
  end

  def self.all(token)
    GithubService.new(token).organizations.map { | org | GithubOrganization.new(org) }
  end

end
