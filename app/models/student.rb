class Student < ApplicationRecord

  has_many :student_courses
  has_many :courses, through: :student_courses
  validates_presence_of :name

  def course_and_grade
    student_courses.joins(:course).select(:grade, 'name', "id", "course_id")
    end
end
