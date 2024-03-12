class CreateBookingHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :booking_histories do |t|
      t.references :booking, null: false, foreign_key: true
      t.string :session_name
      t.string :mentor_name
      t.string :mentee_name
      t.date :booking_date
      t.time :booking_time

      t.timestamps
    end
  end
end
