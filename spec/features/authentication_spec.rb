require 'rails_helper'

RSpec.describe "authenticaion", js: true do
  context "devise" do
    describe "signup" do
      let(:user) { build(:user) }

      before(:example) do
        visit root_path
        click_on "user_signin_link"
        click_on "user_signup_link"
      end

      it 'succeeds with valid attributes' do
        fill_in 'user_username', with: user.username
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: user.password
        fill_in 'user_password_confirmation', with: user.password
        click_on 'user_signup_link'
        expect(page).to have_selector('.sweet-alert',
          text: "تمّ إنشاء الحساب بنجاح، أهلًا بك!")
      end

      it 'fails with invalid attributes' do
        fill_in 'user_username', with: nil
        fill_in 'user_email', with: nil
        fill_in 'user_password', with: nil
        fill_in 'user_password_confirmation', with: nil
        click_on 'user_signup_link'
        expect(page).to have_selector('.sweet-alert', text: "هناك خطأ ما!")
      end
    end

    describe "signin" do
      let(:user) { create(:user) }

      before(:example) do
        visit root_path
        click_on "user_signin_link"
      end

      context "with valid attributes" do
        it "succeeds when signing in using username" do
          fill_in "user_login", with: user.username
          fill_in "user_password", with: user.password
          click_on "user_signin_link"
          expect(page).to have_selector(".sweet-alert",
                                        text: "تمّ تسجيل الدخول بنجاح.")
        end

        it "succeeds when signing in using email" do
          fill_in "user_login", with: user.email
          fill_in "user_password", with: user.password
          click_on "user_signin_link"
          expect(page).to have_selector(".sweet-alert",
                                        text: "تمّ تسجيل الدخول بنجاح.")
        end
      end

      it "fails with invalid attributes" do
        fill_in "user_login", with: nil
        fill_in "user_password", with: user.password
        click_on "user_signin_link"
        expect(page).to have_selector(".sweet-alert",
          text: "إسم المستخدم أو البريد الإلكتروني أو كلمة المرور غير صحيح.")
      end
    end

    describe "signout" do
      it "successfully signs out user" do
        signin(create(:user))
        click_on "تم"
        click_on "user-settings"
        click_on "user_signout_link"
        expect(page).to have_selector(".sweet-alert",
                                      text: "تمّ تسجيل الخروج بنجاح.")
      end
    end
  end

  context "omniauth" do
    context "facebook" do
      it "login succeeds" do
        Rails.application.env_config["devise.mapping"] = Devise.mappings["user"]
        Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
        visit root_path
        click_on "user_signin_link"
        click_on "facebook_login_link"
        expect(page).to have_selector(".sweet-alert",
          text: "تمّ المُصادقة بنجاح باستخدام فيسبوك.")
      end
    end

    context "twitter" do
      it "login succeeds" do
        Rails.application.env_config["devise.mapping"] = Devise.mappings["user"]
        Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
        visit root_path
        click_on "user_signin_link"
        click_on "twitter_login_link"
        expect(page).to have_selector(".sweet-alert",
          text: "تمّ المُصادقة بنجاح باستخدام تويتر.")
      end
    end
  end
end

RSpec.describe 'password reset', type: :mailer do
  before(:example) { ActionMailer::Base.deliveries.clear }
  let(:user) { create(:user) }

  context "with valid attributes" do
    it "sends reset password instructions email" do
      expect(ActionMailer::Base.deliveries.size).to eq(0)
      visit root_path
      click_on "user_signin_link"
      click_on "password_reset_link"
      fill_in "user_email", with: user.email
      click_on "reset_password_link"
      expect(ActionMailer::Base.deliveries.size).to eq(1)
      email = ActionMailer::Base.deliveries.first
      expect(email.from).to match(["no-reply@programer.tv"])
      expect(email.subject).to eq("تعليمات إعادة تعيين كلمة المرور")
    end
  end

  context "with invalid attributes" do
    it "fails and prompts user to fix errors", js: true do
      visit root_path
      click_on "user_signin_link"
      click_on "password_reset_link"
      fill_in "user_email", with: nil
      click_on "reset_password_link"
      expect(page).to have_selector(".sweet-alert", text: "هناك خطأ ما!")
    end
  end
end
