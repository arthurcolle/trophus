class AddLatLongToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lat, :decimal, :precision => 20, :scale => 5
    add_column :users, :long, :decimal, :precision => 20, :scale => 5
  end
end
