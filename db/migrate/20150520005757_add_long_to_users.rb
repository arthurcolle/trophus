class AddLongToUsers < ActiveRecord::Migration
  def change
    add_column :users, :long, :integer
  end
end
