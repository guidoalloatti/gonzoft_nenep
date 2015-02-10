class Product < ActiveRecord::Base
  before_destroy :clear_images
  
  has_attached_file :itinerary_image, :styles => { :small => "150x150>",:medium => "300x300>" },
                  :url  => "/assets/product/itinerary_image/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/product/itinerary_image/:id/:style/:basename.:extension"

  validates_attachment_file_name :itinerary_image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]

  has_attached_file :cruise_image, :styles => { :small => "150x150>", :medium => "300x300>", :large => "640x480>" },
                  :url  => "/assets/product/cruise_image/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/product/cruise_image/:id/:style/:basename.:extension"

  validates_attachment_file_name :cruise_image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
  
  has_attached_file :hotel_image, :styles => { :small => "150x150>",:medium => "300x300>", :large => "1024x768>" },
                  :url  => "/assets/product/hotel_image/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/product/hotel_image/:id/:style/:basename.:extension"

  validates_attachment_file_name :hotel_image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
  
  belongs_to :user

  def boatPresent?
    return self.cruise_image.present? && !self.boatName.empty? && !self.boatLink.empty? 
  end
  
  def hotelPresent?
    return self.hotel_image.present? && !self.hotelName.empty? && !self.hotelLink.empty? 
  end
  
  def showItinerary?
    return self.itinerary_image.present?
  end

  def flightPresent?
    return !self.flightName.empty? && !self.flightFrom.empty? && !self.flightTo.empty? 
  end
  private

  def clear_images
    self.itinerary_image.clear
    self.cruise_image.clear
  end

end
