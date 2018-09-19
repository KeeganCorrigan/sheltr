class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_admin?
  before_action :set_locale

  def current_user
    current_user ||= User.find_by(id: session[:user_id])
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale = I18n.available_locales.include?(locale) ?
      locale :
      I18n.default_locale
  end

  def default_url_options(options={})
    { locale: I18n.locale }
  end

  def require_admin
    render file: '/public/404' unless current_admin?
  end
end
