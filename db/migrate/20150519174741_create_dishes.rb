class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name, limit: 20
      t.string :description, limit: 50
      t.integer :user_id
      t.decimal :price, precision: 10, scale: 2
      t.timestamps
    end
    add_index :dishes, :user_id
  end
end
