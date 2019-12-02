class RatingsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        product_id = params[:id]
        rate = params[:rate]
        rating = Rating.where(product_id: product_id, user_id: current_user.id).first
        if rating.nil?
            rating = Rating.create(product_id: product_id, user_id: current_user.id, rate: rate)
        else
            rating.rate = rate
            rating.save
        end
        respond_to do |format|
            format.json { head :no_content }
            format.js   { render :layout => false }
        end
    end
end
