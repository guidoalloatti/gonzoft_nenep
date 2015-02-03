class AddBoatColumnsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :boatName, :string
    add_column :products, :boatLink, :string
    add_attachment :products, :cruise_image
  end
end
