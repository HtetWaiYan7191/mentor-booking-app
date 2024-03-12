class Review < ApplicationRecord
  belongs_to :user

  validates :review_text, presence: true, length: { minimum: 2 }
  validates :rating, allow_nil: true, numericality: {only_integer: true}

end
