class CreateDesigns < ActiveRecord::Migration[5.2]
  def change
    create_table :designs do |t|
      t.integer :item_id, null: false
      t.integer :material_id, null: false
      t.integer :ribbon_id, null: false

      t.timestamps
    end
  end
end
