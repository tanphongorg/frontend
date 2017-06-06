class CoursesController < ApplicationController

  def new
    @course = Course.new
  end

  def show
    @course = Course.find params[:id]
  end

  def create
    create_course = Api::V1::CreateCourse.call(create_course_params)
    if create_course.success?
      redirect_to course_path(create_course.result)
    else
      render :new
    end
  end

  private

  def create_course_params
    params.require(:course).permit(:title, :description, :price)
      .merge(creator: current_user)
  end
end
