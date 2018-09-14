class TranslatesController < ApplicationController
  def update
    I18n.default_locale = params[:locale]
    redirect_to root_path
  end
end
