require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
  before(:example) { sign_in(create(:admin)) }

  describe "GET #index" do
    before(:example) { get :index }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assigns @results" do
      expect(assigns(:results)).to eq([])
    end

    it "renders index template" do
      expect(response).to render_template(:index)
    end
  end
end
