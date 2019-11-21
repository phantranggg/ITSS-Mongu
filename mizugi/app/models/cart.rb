class Cart < ApplicationRecord
belongs_to :user
belongs_to :product_feature

validates :user_id, presence: true
validates :product_feature_id, presence: true
end
