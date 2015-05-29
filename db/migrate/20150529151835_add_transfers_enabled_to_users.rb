class AddTransfersEnabledToUsers < ActiveRecord::Migration
  def change
    add_column :users, :transfers_enabled, :boolean
  end
end
