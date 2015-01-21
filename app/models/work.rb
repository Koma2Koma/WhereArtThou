class Work < ActiveRecord::Base
  belongs_to :artist

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "150x150>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => ['image/jpeg']
  #validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
