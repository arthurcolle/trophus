class RemoveLimitFromDishes < ActiveRecord::Migration
  def change
  	change_column :dishes, :name, :string, :limit => 255
  	change_column :dishes, :description, :text
  end
end