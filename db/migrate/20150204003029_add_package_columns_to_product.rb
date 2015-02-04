class AddPackageColumnsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :hotelName, :string
    add_column :products, :hotelLink, :string
    add_attachment :products, :hotel_image
    add_column :products, :excursions, :string
    add_column :products, :flightName, :string
    add_column :products, :flightFrom, :string
    add_column :products, :flightTo, :string
  end
end
