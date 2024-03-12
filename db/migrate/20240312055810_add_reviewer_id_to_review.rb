class AddReviewerIdToReview < ActiveRecord::Migration[7.1]
  def change
    add_reference :reviews, :reviewer, foreign_key: { to_table: :users }
  end
end
