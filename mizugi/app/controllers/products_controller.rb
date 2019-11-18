class ProductsController < ApplicationController
  def index
    set_categories_data
    set_products_data
  end
  
  def show

  end
  
  private
  
  def set_categories_data
    @categories = Category.all
  end
  
  def set_products_data
    @products = Product.all
  end
end
