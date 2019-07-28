require 'rails_helper'

RSpec.describe "Student Show Page" do
  before :each do
    @phil = Course.create!(name: 'Philosophy')
    @history = Course.create!(name: 'History')
    @cs = Course.create!(name: 'Computer Science')
    @bio = Course.create!(name: 'Biology')


    @john = Student.create!(name: 'John')
    @jane = Student.create!(name: 'Jane')

    @john_bio = @john.student_courses.create!(course_id: @bio.id, grade: 92.0)
    @john_cs = @john.student_courses.create!(course_id: @cs.id, grade: 75.0)
    @john_history = @john.student_courses.create!(course_id: @history.id, grade: 48.0)
    @john_cs =@john.student_courses.create!(course_id: @phil.id, grade: 86.0)
    @john_phil =@john.student_courses.create!(course_id: @phil.id, grade: 83.0)

    visit student_path(@john)
    end


  describe "When I visit the Student Show page" do
    it "I see the students name" do
        expect(page).to have_content(@john.name)

    end

    it "I see each course the student is in and their grade in that course" do
      expect(page).to have_content(@phil.name)
      expect(page).to have_content(@john_phil.grade)
      expect(page).to have_content(@bio.name)
      expect(page).to have_content(@john_bio.grade)
      expect(page).to have_content(@cs.name)
      expect(page).to have_content(@john_cs.grade)
      expect(page).to have_content(@history.name)
      expect(page).to have_content(@john_history.grade)
      expect(page).not_to have_content(@jane.name)
  
      end
    end
  end
