class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.belongs_to :video
      t.string :name

      t.timestamps
    end
  end
end
