class CreateBookedTimes < ActiveRecord::Migration[7.1]
  def change
    create_table :booked_times do |t|
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
