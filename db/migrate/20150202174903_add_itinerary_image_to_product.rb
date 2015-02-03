class AddItineraryImageToProduct < ActiveRecord::Migration
  def change
    add_attachment :products, :itinerary_image
  end
end
