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
end
