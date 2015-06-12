class AddActiveToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :active, :boolean
  end
end
