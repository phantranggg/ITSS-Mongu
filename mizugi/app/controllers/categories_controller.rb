class CategoriesController < ApplicationController
  def index
    @products = Product.includes(:product_feature, :category).order(created_at: :desc)
  end
  
  def show
    @products = Product.includes(:product_feature, :category).where(category_id: params[:id]).order(created_at: :desc)
  end
end
