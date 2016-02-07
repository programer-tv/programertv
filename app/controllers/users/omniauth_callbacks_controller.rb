class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    provider = request.env["omniauth.auth"]["provider"]
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: provider.capitalize) if is_navigational_format?
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  alias_method :facebook, :all
  alias_method :twitter, :all

  def failure
    redirect_to root_path
  end
end
