class ProductsController < ApplicationController
  def index
    set_categories_data
  end
  
  def show

  end
  
  private
  
  def set_categories_data
    @categories = Category.all
  end
end
