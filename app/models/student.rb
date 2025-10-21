class Student < ApplicationRecord

  #validations
  validates :first_name, :last_name, presence: { message: "First name is Required" }
  validates :first_name, :last_name, length: { minimum: 2, maximum: 20 }
  validates :email, uniqueness: true
 

  #associations
  has_many :enrollments
  has_many :courses, through: :enrollments
  has_many :blogs, dependent: :destroy
  has_many :student_projects, dependent: :destroy
  has_many :projects, through: :student_projects
  
  #callbacks
  after_create :display_student_age
  before_destroy :notify_deletion

  #instance_methods
  def full_name
    "#{first_name} #{last_name}"
  end

  def age
    if self.date_of_birth.present?
      Date.today.year - self.date_of_birth.year
    end
  end

  private

  def display_student_age
    if self.date_of_birth.present?
      age = Date.today.year - date_of_birth.year
      puts "Student Age is #{age} years"
    else
      puts "Age an not be calculated with date of birth"
    end
  end

  def notify_deletion
    StudentNotificationService.send_student_deleted(self)
  end

  def check_course_limit(course)
    if courses.count >= 3
      puts "Course count is #{courses.count} hence can not add more than that"
      raise ActiveRecord::Rollback, "Cannot add more than 3 courses"
    end
  end

  def validate_student_age
    if date_of_birth.present?
      calculated_age = Date.today.year - date_of_birth.year
      if calculated_age < 18
        errors.add(:date_of_birth, "Student must be at least 18 years old")
      end
    end
  end
end