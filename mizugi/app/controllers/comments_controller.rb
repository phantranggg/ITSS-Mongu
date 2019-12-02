class CommentsController < ApplicationController
    def create
        @comment= Comment.new(comment_params)
        @comment.save
        redirect_to product_path(@comment.product_id)
    end
    
    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to product_path(@comment.product_id)
    end
    
    private
    def comment_params
        params.require(:comments).permit(:user_id, :product_id, :content)
    end
end
