class AddYoutubeUsernameToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :youtube_username, :string
  end
end
