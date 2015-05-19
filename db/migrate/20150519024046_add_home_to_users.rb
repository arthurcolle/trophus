class AddHomeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :home, :string
  end
end
