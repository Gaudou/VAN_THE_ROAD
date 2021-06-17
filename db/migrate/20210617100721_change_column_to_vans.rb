class ChangeColumnToVans < ActiveRecord::Migration[6.0]
  def change
    rename_column :vans, :van_city, :address
  end
end
