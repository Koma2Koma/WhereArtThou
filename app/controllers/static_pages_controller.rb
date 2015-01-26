class StaticPagesController < ApplicationController
  def home
  end

  def discover
    @venues = Venue.all
  end
  
  def about
  end
end
