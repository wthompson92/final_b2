# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@phil = Course.create!(name: 'Philosophy')
@history = Course.create!(name: 'History')
@cs = Course.create!(name: 'Computer Science')
@bio = Course.create!(name: 'Biology')
@john = Student.create!(name: 'John')
@jane = Student.create!(name: 'Jane')
@mike = Student.create!(name: 'Mike')
@mary = Student.create!(name: 'Mary')
@john.student_courses.create!(course_id: @bio.id, grade: 92.0)
@john.student_courses.create!(course_id: @cs.id, grade: 75.0)
@john.student_courses.create!(course_id: @history.id, grade: 88.0)
@jane.student_courses.create!(course_id: @bio.id, grade: 99.0)
@jane.student_courses.create!(course_id: @cs.id, grade: 55.0)
@mike.student_courses.create!(course_id: @cs.id, grade: 94.0)
@mike.student_courses.create!(course_id: @phil.id, grade: 54.0)
@mary.student_courses.create!(course_id: @history.id, grade: 98.0)
@mary.student_courses.create!(course_id: @bio.id, grade: 92.0)
@mary.student_courses.create!(course_id: @cs.id, grade: 75.0)
