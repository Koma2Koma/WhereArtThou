class ArtistsController < ApplicationController
 
  def index
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
  end

  def create
  end

  def about
    @artist = Artist.find(params[:id])
  end
    
end

 
