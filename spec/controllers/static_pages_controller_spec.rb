require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe "GET #home" do
    before(:example) { get :home }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders home template" do
      expect(response).to render_template(:home)
    end
  end

  describe "GET #privacy" do
    before(:example) { get :privacy }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders privacy template" do
      expect(response).to render_template(:privacy)
    end
  end

  describe "GET #terms" do
    before(:example) { get :terms }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders privacy template" do
      expect(response).to render_template(:terms)
    end
  end
end
