class AddProfilePicturesToUsers < ActiveRecord::Migration
  def change
  	add_attachment :users, :profile_picture
  	add_column :users, :profile_picture_url, :string
  end
end
