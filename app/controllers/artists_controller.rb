class ArtistsController < ApplicationController
 
  def index
  end

  def show
  end

  def new
  end

  def create
  	@artist = Artist.new(artist_params)
  	@artist.user_id = current_user.user_id
  	if @artist.save
  		redirect
  	else
  		render :new
  	end
  end

end
