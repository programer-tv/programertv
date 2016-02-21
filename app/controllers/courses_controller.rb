class CoursesController < ApplicationController
  before_action :find_course, only: [:show, :edit, :update, :destroy]
  after_action except: [:index] { authorize @course }

  def index
    @courses = Course.get_courses(current_user)
    authorize @courses
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:success] = t("course.create.success")
      redirect_to @course
    else
      flash.now[:error] = t("course.create.error")
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @course.update(course_params)
      flash[:success] = t("course.update.success")
      redirect_to @course
    else
      flash.now[:error] = t("course.update.error")
      render :edit
    end
  end

  def destroy
    @course.destroy
    flash[:success] = t("course.destroy.success")
    redirect_to courses_path
  end

  private

  def find_course
    @course = Course.friendly.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:ar_title, :en_title, :description,
                                   :video_host, :video_id, :premium, :active,
                                   :image, :instructor, :new, :level)
  end
end
