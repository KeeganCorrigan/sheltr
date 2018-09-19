class Api::V1::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    comment = Comment.new
    comment.body = params[:body]
    comment.place_id = params[:place_id]
    if comment.save!
      render json: { message: "Comment created" }, status: 200
      flash[:success] = "Comment submitted for approval."
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.approved == false
      @comment.approved = true
      @comment.save
    end
  end
end
