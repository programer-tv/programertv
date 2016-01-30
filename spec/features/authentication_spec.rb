require 'rails_helper'

RSpec.describe 'Devise authenticaion', js: true do
  describe 'signup' do
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
        text: 'Welcome! You have signed up successfully.')
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

  describe 'signin' do
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
                                      text: "Signed in successfully.")
      end

      it "succeeds when signing in using email" do
        fill_in "user_login", with: user.email
        fill_in "user_password", with: user.password
        click_on "user_signin_link"
        expect(page).to have_selector(".sweet-alert",
                                      text: "Signed in successfully.")
      end
    end

    it "fails with invalid attributes" do
      fill_in "user_login", with: nil
      fill_in "user_password", with: user.password
      click_on "user_signin_link"
      expect(page).to have_selector(".sweet-alert",
                                    text: "Invalid login or password.")
    end
  end

  describe 'signout' do
    it "successfully signs out user" do
      signin(create(:user))
      click_on "OK"
      click_on "user-settings"
      click_on "user_signout_link"
    end
  end

  describe 'forgot password' do
  end
end
