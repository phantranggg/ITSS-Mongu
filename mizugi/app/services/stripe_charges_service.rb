class StripeChargesService
  def initialize params, user
    @stripe_email = params[:stripeEmail]
    @stripe_token = params[:stripeToken]
    @user = user
  end

  def call
    create_charge customer
  end

  private

  attr_accessor :user, :stripe_email, :stripe_token

  def customer
    if user.stripe_token
      retrieve_customer user.stripe_token
    else
      create_customer
    end
  end

  def retrieve_customer stripe_token
    Stripe::Customer.retrieve stripe_token
  end

  def create_customer
    customer = Stripe::Customer.create(
      email: stripe_email,
      source: stripe_token
    )
    user.update_attributes stripe_token: customer.id
    customer
  end

  def create_charge customer
    Stripe::Charge.create(
      customer: customer.id,
      amount: order_amount,
      description: customer.email,
      currency: "usd"
    )
  end

  def order_amount
    @user.show_cart.sum do |item|
      ProductFeature.find_by(id: item.product_feature_id).price * item.quantity
    end
  end

  def dollar_to_cents amount
    (amount * 100).to_i
  end
end