class Like < ApplicationRecord
  belongs_to :end_user
  belongs_to :item, counter_cache: :likes_count
end
