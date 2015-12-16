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

  describe "POST #create" do
    let(:course) { create(:course) }

    context "with valid attributes" do
      before(:example) { post :create, course_id: course,
                         episode: attributes_for(:episode) }

      it "returns http redirect" do
        expect(response).to have_http_status(:redirect)
      end

      it "assigns @course" do
        expect(assigns(:course)).to eq(course)
      end

      it "assigns @episode" do
        expect(assigns(:episode)).to be_present
      end

      it "redirects to show page" do
        episode = assigns(:episode)
        expect(response).to redirect_to(course_episode_path(course, episode))
      end
    end

    context "with invalid attributes" do
      before(:example) { post :create, course_id: course,
                         episode: attributes_for(:episode, en_title: nil) }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "assigns @course" do
        expect(assigns(:course)).to eq(course)
      end

      it "assigns @episode" do
        expect(assigns(:episode)).to be_present
      end

      it "renders new template" do
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PATCH #update" do
    let(:episode) { create(:episode) }

    context "with valid attributes" do
      before(:example) { patch :update, course_id: episode.course, id: episode,
                         episode: attributes_for(:episode) }

      it "returns http redirect" do
        expect(response).to have_http_status(:redirect)
      end

      it "assigns @course" do
        expect(assigns(:course)).to eq(episode.course)
      end

      it "assigns @episode" do
        expect(assigns(:episode)).to eq(episode)
      end

      it "redirects to show page" do
        expect(response).to redirect_to(course_episode_path(episode.course,
                                                            episode))
      end
    end

    context "with invalid attributes" do
      before(:example) { patch :update, course_id: episode.course, id: episode,
                         episode: attributes_for(:episode, en_title: nil) }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "assigns @course" do
        expect(assigns(:course)).to eq(episode.course)
      end

      it "assigns @episode" do
        expect(assigns(:episode)).to eq(episode)
      end

      it "renders edit page" do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    let(:episode) { create(:episode) }
    before(:example) { delete :destroy, course_id: episode.course, id: episode }

    it "returns http redirect" do
      expect(response).to have_http_status(:redirect)
    end

    it "assigns @course" do
      expect(assigns(:course)).to eq(episode.course)
    end

    it "assigns @episode" do
      expect(assigns(:episode)).to eq(episode)
    end

    it "redirects to course show page" do
      expect(response).to redirect_to(episode.course)
    end
  end
end
