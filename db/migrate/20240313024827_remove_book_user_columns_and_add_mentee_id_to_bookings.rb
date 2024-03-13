class RemoveBookUserColumnsAndAddMenteeIdToBookings < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :book_user_name, :string
    remove_column :bookings, :book_user_email, :string
    add_column :bookings, :mentee_id, :integer
  end
end
