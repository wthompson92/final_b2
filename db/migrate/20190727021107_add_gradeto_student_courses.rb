class AddGradetoStudentCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :student_courses, :grade, :float, default: 100

  end
end
