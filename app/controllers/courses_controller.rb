class CoursesController < ApplicationController
  before_action :find_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:success] = "Course created successfully!"
      redirect_to @course
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @course.update(course_params)
      flash[:success] = "Course updated successfully!"
      redirect_to @course
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def find_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:ar_title, :en_title, :description,
                                   :video_host, :video_id, :premium, :active)
  end
end
