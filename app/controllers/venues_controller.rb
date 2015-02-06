class VenuesController < ApplicationController
  respond_to :html, :json

  def index
    @venues =Venue.all
  end

  def show
    @venue = Venue.friendly.find(params[:id])
  end
end
