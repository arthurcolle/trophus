class CreateResidences < ActiveRecord::Migration
  def change
    create_table :residences do |t|
      t.string :name

      t.timestamps
    end
  end
end
