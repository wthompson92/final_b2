require 'rails_helper'

RSpec.describe "Course Show Page" do
  before :each do
      @phil = Course.create!(name: 'Philosophy')
      @john = Student.create!(name: 'John')
      @jane = Student.create!(name: 'Jane')
      @mike = Student.create!(name: 'Mike')
      @john_phil = @john.student_courses.create!(course_id: @phil.id, grade: 92.0)
      @jane_phil =@jane.student_courses.create!(course_id: @phil.id, grade: 72.0)
      @mike_phil =@mike.student_courses.create!(course_id: @phil.id, grade: 82.0)
      visit course_path(@phil)
      save_and_open_page
  end

  it "When I visit the course show page I see a list of all students in that course, ordered by grade (highest to lowest)" do
    expect(page).to have_content(@john.name)
    expect(page).to have_content(@john_phil.grade)
    expect(page).to have_content(@jane.name)
    expect(page).to have_content(@jane_phil.grade)
    expect(page).to have_content(@mike.name)
    expect(page).to have_content(@mike_phil.grade)
  end

    it "I see a form to enroll a new student with a field for the students name." do
  end

  it "When I add the student to the form field and click submit, a new student is create, and I am redirected to the Student show page. On the student show page I see the course in the students course list " do
end 
end
