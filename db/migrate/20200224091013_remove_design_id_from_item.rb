class RemoveDesignIdFromItem < ActiveRecord::Migration[5.2]
  def up
    remove_column :items, :design_id
  end

  def down
    add_column :items, :design_id, :integer
  end
end
