class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :genre_id, null: false
      t.integer :design_id, null: false
      t.integer :status, default: 1, null: false
      t.text :caption, null: false
      t.integer :price, null: false
      t.string :image_id, null: false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
