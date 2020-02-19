class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :order_id, null: false
      t.string :item_name, null: false
      t.string :material_name, null: false
      t.string :ribbon_color, null: false
      t.string :size, null: false
      t.integer :price, null: false
      t.integer :production_status, default: 0, null: false

      t.timestamps
    end
  end
end
