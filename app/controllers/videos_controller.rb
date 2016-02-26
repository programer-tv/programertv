class VideosController < ApplicationController
  before_action :find_video, only: [:show, :edit, :update, :destroy]
  after_action except: [:index] { authorize @video }

  def index
    @videos = Video.get_videos(current_user)
    authorize @videos
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      flash[:success] = t("video.create.success")
      redirect_to @video
    else
      flash.now[:error] = t("video.create.error")
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @video.update(video_params)
      flash[:success] = t("video.update.success")
      redirect_to @video
    else
      flash.now[:error] = t("video.update.error")
      render :edit
    end
  end

  def destroy
    @video.destroy
    flash[:success] = t("video.destroy.success")
    redirect_to videos_path
  end

  private

  def find_video
    @video = Video.friendly.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:ar_title, :en_title, :description,
                                  :video_host, :video_id, :premium, :active,
                                  :image, :instructor, :new, :level, :duration)
  end
end
