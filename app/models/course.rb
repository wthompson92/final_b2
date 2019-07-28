class Course < ApplicationRecord
  has_many :student_courses
  has_many :students, through: :student_courses
  validates_presence_of :name

  def student_name_and_grade
    students.joins(:student_courses)
            .select(:name,'student_courses.grade')
            .distinct
            .order('student_courses.grade DESC')
  end
end
