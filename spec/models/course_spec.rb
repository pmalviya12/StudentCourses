require 'rails_helper'

RSpec.describe Course, type: :model do
  let(:course1) { Course.create(name: "Cucumber Automation", description: "Its is a Automation Project")}
  let!(:course2) { Course.create(name: "Cucumber Automationwith ROR", description: "Its is a Automation Project")}

  #associations
  describe "associations" do 
    it { should have_many(:enrollments) }
    it { should have_many(:students) }
  end

  #validations
  describe "validations" do 
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
  end

  #callbacks
  describe "before_validation: titelize_course_name"
  context
end