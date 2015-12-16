require 'rails_helper'

describe CoursesController, type: :controller do
  describe "GET #index" do
    before(:example) { get :index }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assigns @courses" do
      expect(assigns(:courses)).to eq([])
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

    it "assings @course" do
      expect(assigns(:course)).to be_a_new(Course)
    end

    it "renders new template" do
      expect(response).to render_template(:new)
    end
  end

  describe "GET #show" do
    let(:course) { create(:course) }
    before(:example) { get :show, id: course }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assigns @course" do
      expect(assigns(:course)).to eq(course)
    end

    it "renders show template" do
      expect(response).to render_template(:show)
    end
  end

  describe "GET #edit" do
    let(:course) { create(:course) }
    before(:example) { get :edit, id: course }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assigns @course" do
      expect(assigns(:course)).to eq(course)
    end

    it "renders edit template" do
      expect(response).to render_template(:edit)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      before(:example) { post :create, course: attributes_for(:course) }

      it "returns http redirect" do
        expect(response).to have_http_status(:redirect)
      end

      it "assigns @course" do
        expect(assigns(:course)).to be_present
      end

      it "redirects to show page" do
        course = assigns(:course)
        expect(response).to redirect_to(course)
      end
    end

    context "with invalid attributes" do
      before(:example) { post :create,
                          course: attributes_for(:course, en_title: nil) }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "assigns @course" do
        expect(assigns(:course)).to be_present
      end

      it "renders new template" do
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PATCH #update" do
    let(:course) { create(:course) }

    context "with valid attributes" do
      before(:example) { patch :update, id: course,
                         course: attributes_for(:course) }

      it "returns http redirect" do
        expect(response).to have_http_status(:redirect)
      end

      it "assigns @course" do
        expect(assigns(:course)).to be_present
      end

      it "redirects to show page" do
        expect(response).to redirect_to(course)
      end
    end

    context "with invalid attributes" do
      before(:example) { patch :update, id: course,
                         course: attributes_for(:course, ar_title: nil) }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "assigns @course" do
        expect(assigns(:course)).to be_present
      end

      it "renders edit page" do
        expect(response).to render_template(:edit)
      end
    end
  end
end
