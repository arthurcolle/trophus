class RemoveLatLongFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :lat, :decimal
    remove_column :users, :long, :decimal
  end
end