class EventsController < ApplicationController
  before_action :set_venue, except: :index
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def new
    @event = @venue.events.build
  end

  def show
  end

  def create
    @event = @venue.events.create(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @venue, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @venue }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
  end

  def update
    if user_signed_in?
      if @event.update(event_params)
        redirect_to venue_path(@venue)
      else
        render :edit
      end
    end
  end

  def destroy
    if user_signed_in?    
     @event.destroy
     redirect_to venue_path(@venue)    
    end
  end

  private

  def set_venue
    @venue = Venue.find(params[:venue_id])
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :start_date, :end_date, :start_time, :end_time, :address, :city, :state, :zip, 
    															:description, :contact, :facebook)
  end
end

