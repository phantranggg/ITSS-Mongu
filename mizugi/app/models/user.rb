class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :confirmable, :recoverable
  
  has_many :credit_cards, dependent: :destroy
  after_commit :assign_customer_id, on: :create

  def assign_customer_id
    customer = Stripe::Customer.create email: email
    self.customer_id = customer.id
  end
  
  selecting :product_feature
end
