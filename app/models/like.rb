class Like < ApplicationRecord
  belongs_to :rule, counter_cache: :likes_count
  belongs_to :user
  # validates_uniqueness_of :rule_id, scope: :user_id
end
