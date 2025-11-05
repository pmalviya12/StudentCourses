class Institute < ApplicationRecord
  has_many :courses
  has_one :address, as: :addressable
  accepts_nested_attributes_for :address
end
