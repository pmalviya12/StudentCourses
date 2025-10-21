require 'rails_helper'

RSpec.describe Student, type: :model do
  subject { Student.new(first_name: "Ritu", last_name: "Malviya", email: "test@example.com")}
  it "is valid with attributes" do 
    expect(subject).to be_valid
  end

  it "is not valid without first_name" do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without last name" do
    subject.last_name = nil
    expect(subject).to_not be_valid
  end

  it "is valid with unique email" do
    expect(subject).to be_valid
  end

  it "is not valid without a email" do
    described_class.create!(email: "test@example.com", first_name: "Rajesh", last_name: "Malviya")
    expect(subject).not_to be_valid
  end

  it "is not valid if first name is less than 2 character" do
    subject.first_name = "a"
    expect(subject).to_not be_valid
  end

  it "is not valid is last name is less than 2 character" do
    subject.last_name = "b"
    expect(subject).to_not be_valid
  end
end