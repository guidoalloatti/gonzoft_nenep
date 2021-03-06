class Article < ActiveRecord::Base
  before_destroy :clear_images

  has_attached_file :photo, :styles => { :footer => "64x64>", :small => "150x150>",:medium => "300x300>" },
                  :url  => "/assets/articles/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/articles/:id/:style/:basename.:extension"

  # validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  belongs_to :user

  private 
  
  def clear_images
    self.photo.clear
  end
end
