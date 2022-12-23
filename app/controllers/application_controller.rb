class ApplicationController < ActionController::Base
  #フラッシュメッセージ
  add_flash_types :success, :info, :warning, :danger
  before_action :require_login

  def not_authenticated
    flash[:warning] = t('defaults.message.not_authenticated')
    redirect_to login_path
  end
end
