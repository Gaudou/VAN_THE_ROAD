class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :starting_date
      t.date :ending_date
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :van, null: false, foreign_key: true

      t.timestamps
    end
  end
end
