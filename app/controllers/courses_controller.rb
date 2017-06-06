class CoursesController < ApplicationController

  def new
    @course = Course.new
  end

  def create
    @course = Api::V1::CreateCourse.call(create_course_params)
    if @course.success?
      redirect_to root_path, success: 'Course created!'
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
