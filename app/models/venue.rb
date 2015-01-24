class Venue < ActiveRecord::Base
  geocoded_by :full_street_address

  reverse_geocoded_by :latitude, :longitude
end
