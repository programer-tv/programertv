require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:example) { sign_in(create(:admin)) }

  describe "GET #index" do
    before(:example) { get :index }

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns @users" do
      expect(assigns(:users)).to be_present
    end

    it "renders index template" do
      expect(response).to render_template(:index)
    end
  end

  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  #
  #   it "assigns @article" do
  #     expect(assigns(:article)).to eq(article)
  #   end
  #
  #   it "renders show template" do
  #     expect(response).to render_template(:show)
  #   end
  # end
end
