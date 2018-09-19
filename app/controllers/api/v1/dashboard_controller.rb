class Api::V1::DashboardController < ApplicationController
  before_action :require_admin

  def index
    render json: Comment.where(approved: false)
  end
end
