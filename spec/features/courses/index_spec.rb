require 'rails_helper'

RSpec.describe "Course Index Page" do
  before :each do
      @phil = Course.create!(name: 'Philosophy')
      @history = Course.create!(name: 'History')

      @cs = Course.create!(name: 'Computer Science')
      @bio = Course.create!(name: 'Biology')
      @john = Student.create!(name: 'John')
      @jane = Student.create!(name: 'Jane')
      @mike = Student.create!(name: 'Mike')
      @mary = Student.create!(name: 'Mary')

      @john_bio = @john.student_courses.create!(course_id: @bio.id, grade: 92.0)
      @john_cs = @john.student_courses.create!(course_id: @cs.id, grade: 75.0)
      @john_history = @john.student_courses.create!(course_id: @history.id, grade: 88.0)
      @jane_bio =@jane.student_courses.create!(course_id: @bio.id, grade: 99.0)
      @mike_cs =@mike.student_courses.create!(course_id: @cs.id, grade: 94.0)
      @mike_phil = @mike.student_courses.create!(course_id: @phil.id, grade: 54.0)
      @mary_bio = @mary.student_courses.create!(course_id: @bio.id, grade: 92.0)
      @mary_cs = @mary.student_courses.create!(course_id: @cs.id, grade: 75.0)

      visit courses_path
    end

    describe "When I visit the course index page" do
      it "I see each course with the course name " do
        expect(page).to have_content(@phil.name)
        expect(page).to have_content(@cs.name)
        expect(page).to have_content(@bio.name)
        expect(page).to have_content(@history.name)
    end

    it "I see student in the course and and their grade, sorted from best to worst grade" do
      within "#course-#{@phil.id}" do
        expect(page).to have_content(@mike.name)
        expect(page).to have_content(@mike_phil.grade)
      end

      within "#course-#{@cs.id}" do
        expect(page).to have_content(@john.name)
        expect(page).to have_content(@john_cs.grade)
        expect(page).to have_content(@mike.name)
        expect(page).to have_content(@mike_cs.grade)
        expect(page).to have_content(@mary.name)
        expect(page).to have_content(@mary_cs.grade)
      end

      within "#course-#{@history.id}" do
        expect(page).to have_content(@mary.name)
        expect(page).to have_content(@john.name)
        expect(page).to have_content(@john_history.grade)
      end

      within "#course-#{@bio.id}" do
        expect(page).to have_content(@mary.name)
        expect(page).to have_content(@mary_bio.grade)
        expect(page).to have_content(@jane.name)
        expect(page).to have_content(@jane_bio.grade)
        expect(page).to have_content(@john.name)
        expect(page).to have_content(@john_bio.grade)
      end
    end
  end
end
