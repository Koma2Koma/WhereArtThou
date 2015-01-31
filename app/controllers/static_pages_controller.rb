class StaticPagesController < ApplicationController

  def home
  end

  def discover
    @venues = Venue.all
    @featured_artists = choose_featured_artists
  end
  
  def about
  end

  private

  def choose_featured_artists
    user_artists = User.where(is_artist: true).all
    featured_artists = []
    while featured_artists.length < 3
      sample = user_artists.sample.id
      artist = Artist.find_by(user_id: sample)
      featured_artists.append(artist)
      featured_artists = featured_artists.uniq
    end
    featured_artists
  end
  
end
