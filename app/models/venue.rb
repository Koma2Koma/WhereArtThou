class Venue < ActiveRecord::Base
  include Searchable

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history, :finders]
  
  has_many :events, dependent: :destroy
  belongs_to :user

 geocoded_by :full_street_address
  after_validation :geocode

  searchable_columns :name, :city, :state

  reverse_geocoded_by :latitude, :longitude

  def full_street_address
    [address, city, state].join(', ')
  end

  has_attached_file :picture, :styles => { :thumb => "200x200>", :coverphoto => "925x340#" }, :default_url => "/images/:style/missing.png"
  validates_attachment :picture,
    :content_type => { :content_type => /\Aimage\/.*\Z/ },
    :size => { :in => 0..4.megabytes }
  do_not_validate_attachment_file_type :picture

end
