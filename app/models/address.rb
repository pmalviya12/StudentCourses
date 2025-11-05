class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  def full_address
    [street, city, state, country, zip_code].compact.join(', ')
  end
end
