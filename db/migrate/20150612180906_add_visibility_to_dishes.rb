class AddVisibilityToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :visible, :boolean
  end
end
