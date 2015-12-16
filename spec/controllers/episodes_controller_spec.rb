require 'rails_helper'

describe EpisodesController, type: :controller do
  describe "GET #new" do
    let(:course) { create(:course) }
    before(:example) { get :new, course_id: course }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assigns @course" do
      expect(assigns(:course)).to eq(course)
    end

    it "assigns @episode" do
      expect(assigns(:episode)).to be_a_new(Episode)
    end

    it "renders new template" do
      expect(response).to render_template(:new)
    end
  end

  describe "GET #show" do
    let(:episode) { create(:episode) }
    before(:example) { get :show, course_id: episode.course, id: episode }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assigns @course" do
      expect(assigns(:course)).to eq(episode.course)
    end

    it "assigns @episode" do
      expect(assigns(:episode)).to eq(episode)
    end

    it "renders show template" do
      expect(response).to render_template(:show)
    end
  end

  describe "GET #edit" do
    let(:episode) { create(:episode) }
    before(:example) { get :edit, course_id: episode.course, id: episode }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assigns @course" do
      expect(assigns(:course)).to eq(episode.course)
    end

    it "assigns @episode" do
      expect(assigns(:episode)).to eq(episode)
    end

    it "renders edit template" do
      expect(response).to render_template(:edit)
    end
  end
end
