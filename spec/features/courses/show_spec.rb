require 'rails_helper'

RSpec.describe "Course Show Page" do
  before :each do
      @phil = Course.create!(name: 'Philosophy')
      @john = Student.create!(name: 'John')
      @jane = Student.create!(name: 'Jane')
      @mike = Student.create!(name: 'Mike')
      @john_phil = @john.student_courses.create!(course_id: @phil.id, grade: 92.0)
      @jane_phil =@jane.student_courses.create!(course_id: @phil.id, grade: 72.0)
      @mike_phil =@mike.student_courses.create!(course_id: @phi.id, grade: 82.0)

      visit course_path(@phil)
  end

  it "When I visit the course show page I see a list of all students in that course, ordered by grade (highest to lowest)" do
    expect(page).to have_content(@john.name)
    expect(page).to have_content(@john_phil.grade)
    expect(page).to have_content(@jane.name)
    expect(page).to have_content(@jane_phil.grade)
    expect(page).to have_content(@mike.name)
    expect(page).to have_content(@mike_phil.grade)
  end
end
