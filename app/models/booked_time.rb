class BookedTime < ApplicationRecord
  belongs_to :mentor, class_name: 'User', foreign_key: 'mentor_id'
end
