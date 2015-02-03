class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :price
      t.date :startDate
      t.date :endDate
      t.string :itinerary
      t.integer :nights
      t.integer :productType

      t.timestamps
    end
  end
end
