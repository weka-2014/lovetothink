class AddNameAndBlurbAndImageurlToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :blurb, :text
  	add_column :users, :image_url, :string
  end
end
