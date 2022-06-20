class CreateInventoryFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :inventory_foods do |t|
      t.integer :quantity
      t.references :inventory_id, null: false, foreign_key: true
      t.references :food_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
