class Api::V1::CommentsController < ApplicationController
  before_action :require_admin, only: [:destroy, :update]
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
    render json: { message: "Comment deleted" }, status: 200
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.approved == false
      @comment.approved = true
      @comment.save
      render json: { message: "Comment approved" }, status: 200
    end
  end
end
