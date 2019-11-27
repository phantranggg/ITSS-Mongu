class ChargesController < ApplicationController
  before_action :authenticate_user!

  rescue_from Stripe::CardError do |e|
    redirect_to main_app.root_path, alert: e.message
  end

  def create
    StripeChargesService.new(charges_params, current_user).call
    order = Order.create(
      user_id: current_user.id,
      date: Time.now,
      ship_name: params[:ship_name],
      ship_address: params[:ship_address],
      shipped: 0
    )
    current_user.carts.each do |c|
      OrderDetail.create(
        order_id: order.id,
        product_feature_id: c.product_feature_id,
        quantity: c.quantity
      )
    end
    flash[:notice] = t ".succeed_in_payment"
    redirect_to main_app.root_path
  end

  private

  def charges_params
    params.permit(:stripeEmail, :stripeToken)
  end
end