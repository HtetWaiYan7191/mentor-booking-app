class ChangeStatusToBookingStatus < ActiveRecord::Migration[7.1]
  def change
    rename_column :bookings, :status, :booking_status
  end
end
