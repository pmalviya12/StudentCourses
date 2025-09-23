class Student < ApplicationRecord
  validates :first_name, :last_name, presence: { message: "First name is Required" }, on: :create
  has_many :blogs
  has_and_belongs_to_many :courses
end
