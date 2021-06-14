class CreateVans < ActiveRecord::Migration[6.0]
  def change
    create_table :vans do |t|
      t.string :name
      t.string :model
      t.string :capacity
      t.string :van_city
      t.text :description
      t.integer :price_per_day
      t.boolean :availability, default: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
