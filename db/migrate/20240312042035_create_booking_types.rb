class CreateBookingTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :booking_types do |t|
      t.string :name
      t.integer :minutes
      t.integer :payment

      t.timestamps
    end
  end
end
