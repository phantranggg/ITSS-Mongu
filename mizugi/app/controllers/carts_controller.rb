class CartsController < ApplicationController
  before_action :load_product_feature, only: %i(update destroy)

  def index
    redirect_to root_path unless current_user
    @total = 0
  end

  def update
    if params[:btn_type] == "add"
      product_feature_qty = params[:product_feature_qty].to_i

      current_user.add_multiple_to_cart @male_product, product_feature_qty
      current_user.add_multiple_to_cart @female_product, product_feature_qty
    elsif params[:btn_type] == "remove"
      current_user.remove_from_cart @male_product
      current_user.remove_from_cart @female_product
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
    @male_product = ProductFeature.find_by id: params[:male_product_id]
    @female_product = ProductFeature.find_by id: params[:female_product_id]

    redirect_to main_app.root_path unless @male_product && @female_product
  end
end