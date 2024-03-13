class AddMentorIdToBookedTimes < ActiveRecord::Migration[7.1]
  def change
    add_column :booked_times, :mentor_id, :bigint
    add_foreign_key :booked_times, :users, column: :mentor_id
  end
end
