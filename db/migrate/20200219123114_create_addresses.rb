class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :name, null: false
      t.string :zipcode, null: false
      t.string :address, null: false
      t.integer :end_user_id, null: false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
