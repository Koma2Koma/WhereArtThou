class StaticPagesController < ApplicationController

  def home
  end

  def discover
    @venues = Venue.all
    @featured_artists = Artist.limit(5).order("RANDOM()")
  end
  
  def about
  end
end
