class Venue < ActiveRecord::Base
  validates :address, :city, :state, presence: true

  geocoded_by :full_street_address
  after_validation :geocode

  reverse_geocoded_by :latitude, :longitude

  def full_street_address
    [address, city, state].join(', ')
  end

end
