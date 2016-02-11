class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include Pundit
  after_action :verify_authorized, unless: :devise_controller?

  before_action :authenticate_user!
  before_action :devise_user_params, if: :devise_controller?

  private

  def devise_user_params
		devise_parameter_sanitizer.for(:sign_up) {
      |user| user.permit(:username, :email, :password, :password_confirmation)
    }

    devise_parameter_sanitizer.for(:sign_in) {
      |user| user.permit(:login, :username, :email, :password, :remember_me)
    }
  end
end
