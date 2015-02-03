class Venue < ActiveRecord::Base
  has_many :events, dependent: :destroy
  belongs_to :user

  geocoded_by :full_street_address
  after_validation :geocode

  # searchable

  reverse_geocoded_by :latitude, :longitude

  def full_street_address
    [address, city, state].join(', ')
  end

  has_attached_file :picture, :styles => { :thumb => "200x200>", :coverphoto => "925x340#" }, :default_url => "/images/:style/missing.png"
  validates_attachment :picture,
    :content_type => { :content_type => /\Aimage\/.*\Z/ },
    :size => { :in => 0..4.megabytes }
  do_not_validate_attachment_file_type :picture

  def self.venue_search_doc(query)    
    where_conditions = [" (to_tsvector(name) ||
                        to_tsvector(city) ||
                        to_tsvector(state) ) @@ plainto_tsquery(?)", query]
    Venue.where(where_conditions).all
  end

end
