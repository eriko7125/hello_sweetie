class AddLikesCountToItem < ActiveRecord::Migration[5.2]
  def up
    add_column :items, :likes_count, :integer
  end

  def down
    remove_column :items, :likes_count
  end
end
