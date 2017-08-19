class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper
  before_action :set_device_type
  before_action :require_login

  private

  def require_login
    user = current_user
    unless user
      redirect_to root_path
    end
  end

  def set_device_type #allows use of @browser.device.mobile? in views
    request.variant = :phone if browser.device.mobile?
  end
end
