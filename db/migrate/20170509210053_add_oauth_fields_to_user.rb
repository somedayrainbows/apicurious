class AddOauthFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_token_secret, :string
  end
end
