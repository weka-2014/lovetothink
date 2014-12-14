class AddSoundcloudUsernameToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :soundcloud_username, :string
  end
end
