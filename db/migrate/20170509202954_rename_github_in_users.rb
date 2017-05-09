class RenameGithubInUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :github, :provider
  end
end
