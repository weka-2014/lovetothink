class CreateHashtags < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
    	t.belongs_to :tweet
      t.string :text

      t.timestamps
    end
  end
end
