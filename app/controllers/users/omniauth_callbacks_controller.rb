class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    provider = request.env["omniauth.auth"]["provider"]
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      if provider == "facebook"
        set_flash_message(:notice, :success, kind: "فيسبوك") if is_navigational_format?
      elsif provider == "twitter"
        set_flash_message(:notice, :success, kind: "تويتر") if is_navigational_format?
      end
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"]
      flash[:error] = "إسم المستخدم أو البريد الإلكتروني مسجل لدينا مسبقا."
      redirect_to new_user_registration_url
    end
  end

  alias_method :facebook, :all
  alias_method :twitter, :all

  def failure
    redirect_to root_path
  end
end
