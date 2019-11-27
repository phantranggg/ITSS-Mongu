class ProductFeature < ApplicationRecord
    belongs_to :product
    selected_by :user
    
    scope :for_male, -> { where(gender: 0) }
    scope :for_female, -> { where(gender: 1) }
end
