class RemoveSizeFromCartItem < ActiveRecord::Migration[5.2]
  def up
    remove_column :cart_items, :size
  end

  def down
    add_column :cart_items, :size, :string
  end
end
