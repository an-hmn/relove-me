class AddLongitudeToSale < ActiveRecord::Migration
  def change
    add_column :sales, :longitude, :float
  end
end
