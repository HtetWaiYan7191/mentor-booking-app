class ChangeUserIdToMentorIdInBookings < ActiveRecord::Migration[7.1]
  def change
    rename_column :bookings, :user_id, :mentor_id
  end
end
