class AddComponentsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :components, :text
  end
end
