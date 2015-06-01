class AddFloatCoordinatesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lat_f, :decimal, :precision => 9, :scale => 6
    add_column :users, :long_f, :decimal, :precision => 9, :scale => 6
  end
end
