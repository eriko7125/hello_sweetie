class AddMaterialIdToCartItem < ActiveRecord::Migration[5.2]
  def up
    add_column :cart_items, :material_id, :integer
    add_column :cart_items, :ribbon_id, :integer
    change_column_null :cart_items, :material_id, :integer, false
    change_column_null :cart_items, :ribbon_id, :integer, false
  end

  def down
    remove_column :cart_items, :material_id
    remove_column :cart_items, :ribbon_id
  end
end
