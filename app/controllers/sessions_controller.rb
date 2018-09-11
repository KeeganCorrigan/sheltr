class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])

    if user.valid?
      session[:user_id] = user.id
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
