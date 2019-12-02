class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :confirmable, :recoverable
  
  has_many :ratings
  has_many :credit_cards, dependent: :destroy

  selecting :product_feature
  
  def total_cart_costs
    self.carts.
      inject(0) {|result, cart| result + cart.product_feature.price * cart.quantity}
  end
end
