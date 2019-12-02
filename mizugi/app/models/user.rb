class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :confirmable, :recoverable
<<<<<<< HEAD
  has_many :comments
=======
  
  has_many :ratings
  has_many :credit_cards, dependent: :destroy

  selecting :product_feature
  
  def total_cart_costs
    self.carts.
      inject(0) {|result, cart| result + cart.product_feature.price * cart.quantity}
  end
>>>>>>> 964cd461c7eb63ea3e4f56fab29179148966c27a
end
