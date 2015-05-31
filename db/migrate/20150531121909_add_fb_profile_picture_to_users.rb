class AddFbProfilePictureToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fb_hd_profile_picture, :string
  end
end
