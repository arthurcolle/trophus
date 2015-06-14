class AddDirectImageUrlToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :direct_image_url, :text
  end
end
