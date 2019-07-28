class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
    # @course_and_grade = @student.course_and_grade
    # binding.pry
  end
end
