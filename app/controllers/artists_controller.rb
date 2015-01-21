class ArtistsController < ApplicationController
 
  def index
  end

  def show
    @artist = Artist.find_by(user_id: params[:id])
  end

  def new
  end

  def create
  end

end
