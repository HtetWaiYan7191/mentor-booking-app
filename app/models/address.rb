class Address < ApplicationRecord
  belongs_to :user

  validates :country_name, presence: true, length: {in: 3..40}
  validates :city_name, presence: true, length: {in: 3..40}
end
