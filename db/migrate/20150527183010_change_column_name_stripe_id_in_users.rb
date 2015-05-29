class ChangeColumnNameStripeIdInUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :stripe_id, :customer_id
  end
end
