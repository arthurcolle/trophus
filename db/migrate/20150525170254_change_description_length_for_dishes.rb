class ChangeDescriptionLengthForDishes < ActiveRecord::Migration
  def change
  	remove_column :dishes, :description
  	add_column :dishes, :description, :string, limit: 150
  end
end