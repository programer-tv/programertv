class EpisodesController < ApplicationController
  before_action :find_course
  before_action :find_episode, except: [:new]

  def new
    @episode = @course.episodes.build
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_course
    @course = Course.find(params[:course_id])
  end

  def find_episode
    @episode = Episode.find(params[:id])
  end
end
