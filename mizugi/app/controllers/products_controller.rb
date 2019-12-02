class ProductsController < ApplicationController
  def index
    set_categories_data
    set_products_data
  end
  
  def show
    @product = Product.includes(:product_feature, :category).find(params[:id])
    @selected_male_product = @product.product_feature.for_male.first
    @selected_female_product = @product.product_feature.for_female.first
    @male_product_colors = Product.male_product_colors(@product)
    @female_product_colors = Product.female_product_colors(@product)
    @male_product_sizes = Product.male_product_sizes(@product)
    @female_product_sizes = Product.female_product_sizes(@product)
    @all_comments = Comment.includes(:user).where(product_id: @product.id)
  end
  
  def update_price
    @product = Product.includes(:product_feature, :category).find(params[:id])
    @selected_male_product = @product.product_feature.for_male.where(size: params[:male_size], color: params[:male_color]).first
    @selected_female_product = @product.product_feature.for_female.where(size: params[:female_size], color: params[:female_color]).first
    
    render json: {
      selected_male_product: @selected_male_product,
      selected_female_product: @selected_female_product
    }
  end
  
  private
  
  def set_categories_data
    @categories = Category.all
  end
  
  def set_products_data
    @products = Product.limit(8)
    @latest_products = Product.latest
  end
end
