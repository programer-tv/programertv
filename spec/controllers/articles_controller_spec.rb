require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  before(:example) { sign_in(create(:user)) }

  describe "GET #index" do
    before(:example) { get :index }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assigns @articles" do
      expect(assigns(:articles)).to eq([])
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

    it "assings @article" do
      expect(assigns(:article)).to be_a_new(Article)
    end

    it "renders new template" do
      expect(response).to render_template(:new)
    end
  end

  describe "GET #show" do
    let(:article) { create(:article) }
    before(:example) { get :show, id: article }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assigns @article" do
      expect(assigns(:article)).to eq(article)
    end

    it "renders show template" do
      expect(response).to render_template(:show)
    end
  end

  describe "GET #edit" do
    let(:article) { create(:article) }
    before(:example) { get :edit, id: article }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assigns @article" do
      expect(assigns(:article)).to eq(article)
    end

    it "renders edit template" do
      expect(response).to render_template(:edit)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      before(:example) { post :create, article: attributes_for(:article) }

      it "returns http redirect" do
        expect(response).to have_http_status(:redirect)
      end

      it "assigns @article" do
        expect(assigns(:article)).to be_present
      end

      it "redirects to show page" do
        article = assigns(:article)
        expect(response).to redirect_to(article)
      end
    end

    context "with invalid attributes" do
      before(:example) { post :create,
                          article: attributes_for(:article, en_title: nil) }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "assigns @article" do
        expect(assigns(:article)).to be_present
      end

      it "renders new template" do
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PATCH #update" do
    let(:article) { create(:article) }

    context "with valid attributes" do
      before(:example) { patch :update, id: article,
                         article: attributes_for(:article) }

      it "returns http redirect" do
        expect(response).to have_http_status(:redirect)
      end

      it "assigns @article" do
        expect(assigns(:article)).to eq(article)
      end

      it "redirects to show page" do
        article = assigns(:article)
        expect(response).to redirect_to(article)
      end
    end

    context "with invalid attributes" do
      before(:example) { patch :update, id: article,
                         article: attributes_for(:article, ar_title: nil) }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "assigns @article" do
        expect(assigns(:article)).to eq(article)
      end

      it "renders edit page" do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    let(:article) { create(:article) }
    before(:example) { delete :destroy, id: article }

    it "return http redirect" do
      expect(response).to have_http_status(:redirect)
    end

    it "assigns @article" do
      expect(assigns(:article)).to eq(article)
    end

    it "redirects to index page" do
      expect(response).to redirect_to(articles_path)
    end
  end
end
