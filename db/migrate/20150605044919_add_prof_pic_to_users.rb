class AddProfPicToUsers < ActiveRecord::Migration
  def change
    add_column :users, :prof_pic, :string
  end
end
