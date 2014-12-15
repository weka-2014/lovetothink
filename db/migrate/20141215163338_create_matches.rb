class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
    	t.belongs_to :user
    	t.integer :match_user_id
    	t.float :twitter_percent
    	t.float :youtube_percent
    	t.float :soundcloud_percent
    	t.float :overall_percent
    	
      t.timestamps
    end
  end
end
