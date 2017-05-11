class User < ApplicationRecord

  def self.from_omniauth(auth_hash)
    where(uid: auth_hash[:uid]).first_or_create do |new_user|
      new_user.provider           = auth_hash.provider
      new_user.uid                = auth_hash.uid
      new_user.name               = auth_hash.info.name
      new_user.username           = auth_hash.info.nickname
      new_user.oauth_token        = auth_hash.credentials.token
      new_user.oauth_token_secret = auth_hash.credentials.secret
    end
  end

    # where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
    # create! do |user|
    #   user.provider = auth["github"]
    #   user.uid = auth["uid"]
    #   user.name = auth["info"]["name"]
    # end

  # def self.create_from_omniauth(auth)
  #   create! do |user|
  #     user.provider = auth["provider"]
  #     user.uid = auth["uid"]
  #     user.name = auth["info"]["name"]

end
