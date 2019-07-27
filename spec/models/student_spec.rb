require 'rails_helper'

RSpec.describe Student do
  describe 'Relationships' do
    it {should have_many :courses}
  end

  describe 'Validations' do
    it {should validate_presence_of :name}
    # it {should validate_presence_of :grade}
  end
end
