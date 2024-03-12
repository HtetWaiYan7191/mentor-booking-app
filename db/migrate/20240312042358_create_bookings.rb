class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :booking_type, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :book_user_name
      t.string :book_user_email
      t.text :introduction_text
      t.integer :status
      t.date :booking_date
      t.string :session_name
      t.time :booking_time

      t.timestamps
    end
  end
end
