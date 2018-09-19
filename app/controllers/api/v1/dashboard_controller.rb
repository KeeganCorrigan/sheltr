class Api::V1::DashboardController < ApplicationController
  def index
    render json: Comment.where(approved: false)
  end
end
