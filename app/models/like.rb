class Like < ApplicationRecord
  belongs_to :style, counter_cache: :likes_count
  belongs_to :user
end
