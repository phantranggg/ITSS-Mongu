class OrdersController < ApplicationController
    def index
        @product_features = Cart.includes(product_feature: [:product])
        @total = 0
        @product_features.each do |cart|
            @total += cart.product_feature.price * cart.quantity
        end
    end

    def create
        
    end
end
