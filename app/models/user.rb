class User < ApplicationRecord

  def self.from_omniauth(auth)
    where(uid: auth[:uid]).first_or_create do |new_user|
      new_user.uid                = auth.uid
      new_user.name               = auth.extra.raw_info.name
      new_user.nickname           = auth.extra.raw_info.nickname
      new_user.oauth_token        = auth.credentials.token
      new_user.oauth_token_secret = auth.credentials.secret
    end
  end

    # where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
    # create! do |user|
    #   user.provider = auth["github"]
    #   user.uid = auth["uid"]
    #   user.name = auth["info"]["name"]
    # end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]

end
