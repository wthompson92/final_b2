class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.find(params[:id])
  end


    def new
      @student = Student.cre(params[:id])
    end
  end
