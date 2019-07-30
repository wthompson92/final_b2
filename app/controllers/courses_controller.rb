class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end
end

  # def new
  #   @student = Course.students.new
  #   binding.pry
  # end
  #
  #   def create
  #     @studen = Course.find(params[:id])
  #     binding.pry
  #   end
