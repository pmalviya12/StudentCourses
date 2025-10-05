class Course < ApplicationRecord
  self.per_page = 5
  include Validatable

  #associations
  has_many :enrollments
  has_many :students, through: :enrollments
  
  #callbacks
  before_validation :titelize_course_name
  after_validation :log_errors

  private
  def titelize_course_name
    self.name = name.downcase.titleize if name.present?
    Rails.logger.info "Name is titleize to: #{name}"
  end

  def log_errors
    if errors.any?
      Rails.logger.info "Validation failed #{errors.full_messages.join(', ')}"
    end
  end
end
