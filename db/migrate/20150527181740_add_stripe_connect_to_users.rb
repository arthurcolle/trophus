class AddStripeConnectToUsers < ActiveRecord::Migration
  def change
    add_column :users, :connect_id, :string
    add_column :users, :secret_id, :string
    add_column :users, :publishable_id, :string
  end
end
