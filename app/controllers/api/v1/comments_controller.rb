class Api::V1::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create

    comment = Comment.new
    comment.body = params[:body]
    comment.place_id = params[:place_id]
    if comment.save!
      render json: { message: "it worked" }, status: 200
      flash[:success] = "Comment submitted for approval."
    end
  end
end
