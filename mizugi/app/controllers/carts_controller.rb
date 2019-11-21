class CartsController < ApplicationController
  before_action :load_product_feature, only: %i(update destroy)

  def index
    redirect_to root_path unless current_user
    @total = current_user.total_cart_costs
  end

  def update
    if params[:btn_type] == "add"
      product_feature_qty = params[:product_feature_qty].to_i

      current_user.add_multiple_to_cart @product_feature, product_feature_qty
    elsif params[:btn_type] == "remove"
      current_user.remove_from_cart @product_feature
    end

    respond_to do |f|
      f.html {redirect_to :carts}
      f.js
    end
  end

  def destroy
    item = Cart.find_by user_id: current_user.id, product_feature_id: @product_feature.id

    if item.destroy
      respond_to do |f|
        f.html {redirect_to :carts}
        f.js
      end
    else
      flash[:notice] = t ".fail_to_delete_item"
    end
  end

  private

  def load_product_feature
    @product_feature = ProductFeature.find_by id: params[:product_feature_id]

    redirect_to main_app.root_path unless @product_feature
  end
end