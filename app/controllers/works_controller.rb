class WorksController < ApplicationController
  before_action :set_artist, except: [:index, :get_work_data, :add_tile, :remove_tile]
  before_action :set_work, only: [:show, :edit, :update, :destroy, :add_tile, :remove_tile]

  def new
    @work = Work.new
  end

  def show
  end

  def create
    @work = @artist.works.create(work_params)

    respond_to do |format|
      if @work.save
        format.html { redirect_to @artist, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @artist }
      else
        format.html { render :new }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  def index

    search_params = params[:search].downcase if params[:search] != nil

    works = Work.work_search_doc(search_params)

    @artists = User.user_artist_search_doc(search_params)

    @venues = Venue.venue_search_doc(search_params)

    @events = Event.event_search_doc(search_params)

    @users = User.user_search_doc(search_params)

    tags = Work.tagged_with(search_params).all

    

    @works = (works + tags).uniq


    ###### Original Search Setup #######
    # search_params = params[:search].downcase if params[:search] != nil

    # if search_params
    #   @works = Work.where('lower(title) LIKE ?', "%#{search_params}%")
    #   @user_artists = User.where('lower(username) LIKE ? AND is_artist = ?', "%#{search_params}%", true)
    #   @users = User.where('lower(username) LIKE ? AND is_artist = ?', "%#{search_params}%", false)
    # elsif params[:tag]
    #   @works = Work.tagged_with(params[:tag])
    #   @user_artists = User.where(is_artist: true)
    #   @users = User.where(is_artist: false)
    # else
    #   @works = Work.all
    #   @user_artists = User.where(is_artist: true)
    #   @users = User.where(is_artist: false)
    # end
  end

  def update
    if user_signed_in?
      if @work.update(work_params)
        redirect_to artist_path(@artist)
      else
        render :edit
      end
    end
  end

  def destroy
    if user_signed_in?    
     @work.destroy
     redirect_to artist_path(@artist)    
    end
  end

  def get_work_data
    ## Create usable instance variables
    @work = Work.find(params["work"])
    artist = Artist.find(@work.artist_id)
    @artist = User.find(artist.user_id)

    respond_to do |format|
      format.js
    end
  end

  def add_tile()
    current_user.like!(@work) if current_user
    respond_to do |format|
      format.js
    end
  end

  def remove_tile()
    current_user.unlike!(@work) if current_user
    respond_to do |format|
      format.js
    end
  end

  private

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def set_work
    @work = Work.find(params[:id])
  end

  def work_params
    params.require(:work).permit(:image, :style, :year, :title, :description, :price, :medium, :tag_list, :image_file_name)
  end
end
