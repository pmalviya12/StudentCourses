class Demo < ApplicationRecord
  include Validatable

  has_one :sub_demo

  #validates :terms_of_services, acceptance: true
  before_validation :custom_validation_message

  before_create :greeting_message
  after_create do
  	puts "------------------------"
  	puts "Hey Demo is created!!!!"
  	puts "************************"
  end

  def greeting_message
  	puts "--------------------------------------"
  	puts "Hey I will run before you create Demo"
  	puts " -------------------------------------"
  end

  def custom_validation_message
  	puts "Please follow validations"
  end
end
