class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :confirmable, :recoverable
  
  has_many :credit_cards, dependent: :destroy

  selecting :product_feature
end
