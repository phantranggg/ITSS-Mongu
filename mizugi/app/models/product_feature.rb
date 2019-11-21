class ProductFeature < ApplicationRecord
    belongs_to :product
    selected_by :user
end
