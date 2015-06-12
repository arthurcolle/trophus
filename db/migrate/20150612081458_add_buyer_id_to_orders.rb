class AddBuyerIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :buyer_id, :integer
  end
end
