class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reviewer, class_name: 'User', foreign_key: 'reviewer_id'
  validates :review_text, presence: true, length: { minimum: 2 }
  validates :rating, allow_nil: true, numericality: { only_integer: true }
  validates :reviewer_id, presence: true
end
