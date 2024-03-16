class Address < ApplicationRecord
  belongs_to :user

  validates :country_name, allow_nil: true
  validates :city_name, allow_nil: true


end
