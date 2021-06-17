class ChangeColumnToVansAgain < ActiveRecord::Migration[6.0]
  def change
    rename_column :vans, :address, :van_city
  end
end
