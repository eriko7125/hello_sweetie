class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id, null: false
      t.string :name, null: false
      t.string :zipcode, null: false
      t.string :address, null: false
      t.integer :status, default: 0, null: false
      t.integer :sum_price, null: false
      t.integer :shipping_price, null: false
      t.integer :payment_price, null: false

      t.timestamps
    end
  end
end
