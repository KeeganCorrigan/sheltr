class Admin::DashboardController < Admin::BaseController
  def index
    @comments_count = Comment.where(approved: false).count
  end
end
