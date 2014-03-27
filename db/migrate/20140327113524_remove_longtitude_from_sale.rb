class RemoveLongtitudeFromSale < ActiveRecord::Migration
  def change
    remove_column :sales, :longtitude, :float
  end
end
