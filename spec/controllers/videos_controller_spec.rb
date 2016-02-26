require 'rails_helper'

RSpec.describe VideosController, type: :controller do
  before(:example) { sign_in(create(:admin)) }

  describe "GET #index" do
    before(:example) { get :index }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assigns @videos" do
      expect(assigns(:videos)).to eq([])
    end

    it "renders index template" do
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
    before(:example) { get :new }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assings @video" do
      expect(assigns(:video)).to be_a_new(Video)
    end

    it "renders new template" do
      expect(response).to render_template(:new)
    end
  end

  describe "GET #show" do
    let(:video) { create(:video) }
    before(:example) { get :show, id: video }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assigns @video" do
      expect(assigns(:video)).to eq(video)
    end

    it "renders show template" do
      expect(response).to render_template(:show)
    end
  end

  describe "GET #edit" do
    let(:video) { create(:video) }
    before(:example) { get :edit, id: video }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assigns @video" do
      expect(assigns(:video)).to eq(video)
    end

    it "renders edit template" do
      expect(response).to render_template(:edit)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      before(:example) { post :create, video: attributes_for(:video) }

      it "returns http redirect" do
        expect(response).to have_http_status(:redirect)
      end

      it "assigns @video" do
        expect(assigns(:video)).to be_present
      end

      it "redirects to show page" do
        video = assigns(:video)
        expect(response).to redirect_to(video)
      end
    end

    context "with invalid attributes" do
      before(:example) { post :create, video: attributes_for(:video, en_title: nil) }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "assigns @video" do
        expect(assigns(:video)).to be_present
      end

      it "renders new template" do
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PATCH #update" do
    let(:video) { create(:video) }

    context "with valid attributes" do
      before(:example) { patch :update, id: video,
                         video: attributes_for(:video) }

      it "returns http redirect" do
        expect(response).to have_http_status(:redirect)
      end

      it "assigns @video" do
        expect(assigns(:video)).to eq(video)
      end

      it "redirects to show page" do
        video = assigns(:video)
        expect(response).to redirect_to(video)
      end
    end

    context "with invalid attributes" do
      before(:example) { patch :update, id: video,
                         video: attributes_for(:video, ar_title: nil) }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "assigns @video" do
        expect(assigns(:video)).to eq(video)
      end

      it "renders edit page" do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    let(:video) { create(:video) }
    before(:example) { delete :destroy, id: video }

    it "return http redirect" do
      expect(response).to have_http_status(:redirect)
    end

    it "assigns @video" do
      expect(assigns(:video)).to eq(video)
    end

    it "redirects to index page" do
      expect(response).to redirect_to(videos_path)
    end
  end
end
