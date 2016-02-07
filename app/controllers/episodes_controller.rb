class EpisodesController < ApplicationController
  before_action :find_course
  before_action :find_episode, except: [:new, :create]

  def new
    @episode = @course.episodes.build
  end

  def create
    @episode = @course.episodes.build(episode_params)
    if @episode.save
      flash[:success] = "Episode created successfully!"
      redirect_to course_episode_path(@course, @episode)
    else
      flash.now[:error] = "Something went wrong!"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @episode.update(episode_params)
      flash[:success] = "Episode updated successfully!"
      redirect_to course_episode_path(@course, @episode)
    else
      flash.now[:error] = "Something went wrong!"
      render :edit
    end
  end

  def destroy
    @episode.destroy
    flash[:success] = "Episode deleted successfully!"
    redirect_to @course
  end

  private

  def find_course
    @course = Course.friendly.find(params[:course_id])
  end

  def find_episode
    @episode = Episode.friendly.find(params[:id])
  end

  def episode_params
    params.require(:episode).permit(:en_title, :ar_title, :description,
                                    :sequence, :video_host, :video_id, :image)
  end
end
