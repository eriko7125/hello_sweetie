class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.string :name, null: false
      t.string :image_id, null: false
      t.integer :status, default: 1, null: false

      t.timestamps
    end
  end
end
