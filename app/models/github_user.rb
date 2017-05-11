class GithubUser

  def initialize
    @token = token
    @_conn = Faraday.new("https://api.github.com")
  end

  def user_find(token)
    response = conn.get('/user?access_token=#{token}')
    JSON.parse(response.body)
  end

  def followers
    #should return an array of followers.count
  end

  def following
    #should return an array of users following you.count
  end

end
