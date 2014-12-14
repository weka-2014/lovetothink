class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.belongs_to :user
      t.string :image_url
      t.text :description
      t.string :genre
      t.string :track_url
      t.string :title
      t.string :author

      t.timestamps
    end
  end
end
