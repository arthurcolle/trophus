class AddLatLongStringsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lat, :string
    add_column :users, :long, :string
  end
end
