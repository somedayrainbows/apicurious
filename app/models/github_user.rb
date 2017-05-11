class GithubUser

  def initialize

  end

  # def user_find(token)
  #   response = conn.get('/user')
  #   JSON.parse(response.body)
  # end

  def self.followers(token)
    GithubService.new(token).followers.map { |follower| GithubUser.new }
      #should return an array of followers.count
  end

  def self.following(token)
    GithubService.new(token).following.map { |following| GithubUser.new }
    #should return an array of users following you.count
  end


end
