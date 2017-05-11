class GithubService

  def initialize(token)
    @_conn = Faraday.new("https://api.github.com", params: {access_token: token})
  end

  def repos
    response = conn.get("/user/repos")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    @_conn
  end
  
end
