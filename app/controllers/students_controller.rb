class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.find(params[:id])
  end

  def create
    @student = course.find(params[:id])
    @student.create(student_params)
    redirect_to student_path(@student)
  end

  private
  def student_params
    params.require[:student].permit(:name)
  end

end
