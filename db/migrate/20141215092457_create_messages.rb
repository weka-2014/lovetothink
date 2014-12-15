class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
    	t.belongs_to :conversation
    	t.integer :sender_id
    	t.integer :recipient_id
    	t.text :content

      t.timestamps
    end
  end
end
