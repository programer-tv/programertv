require "rails_helper"

RSpec.describe Users::OmniauthCallbacksController, type: :controller do
  describe "GET #facebook" do
    before(:example) do
      request.env["devise.mapping"] = Devise.mappings[:user]
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
      get :facebook
    end

    it "returns https redirect" do
      expect(response).to have_http_status(:redirect)
    end

    it "assigns @user" do
      expect(assigns(:user)).to be_present
    end
  end

  describe "POST #facebook" do
    before(:example) do
      request.env["devise.mapping"] = Devise.mappings[:user]
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
      post :facebook
    end

    it "returns https redirect" do
      expect(response).to have_http_status(:redirect)
    end

    it "assigns @user" do
      expect(assigns(:user)).to be_present
    end
  end
end
