class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.belongs_to :user
      t.string :url
      t.string :title
      t.text :description
      t.string :label
      t.string :author

      t.timestamps
    end
  end
end
