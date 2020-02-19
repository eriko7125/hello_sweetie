class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :name, null: false
      t.integer :status, default: 1, null: false

      t.timestamps
    end
  end
end
