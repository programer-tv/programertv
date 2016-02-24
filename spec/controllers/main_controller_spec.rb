require 'rails_helper'

RSpec.describe MainController, type: :controller do
  before(:example) { sign_in(create(:admin)) }

  describe "GET #all" do
    before(:example) { get :all }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assigns @resources" do
      expect(assigns(:resources)).to eq([])
    end

    it "renders all template" do
      expect(response).to render_template(:all)
    end
  end
end
