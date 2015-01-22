class WorksController < ApplicationController
  before_action :set_artist, except: :index
  before_action :set_work, only: [:show, :edit, :update, :destroy]

  def new
    @work = Work.new
  end

  def show
  end

  def create
    @work = @artist.works.create(work_params)

    respond_to do |format|
      if @work.save
        format.html { redirect_to @artist, notice: 'Lesson was successfully created.' }
        format.json { render :show, status: :created, location: @artist }
      else
        format.html { render :new }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  def index

    search_params = params[:search].downcase if params[:search] != nil

    if search_params
      @works = Work.where('lower(title) LIKE ?', "%#{search_params}%")
      @artists = User.where('lower(username) LIKE ? AND is_artist = ?', "%#{search_params}%", true)
      @users = User.where('lower(username) LIKE ? AND is_artist = ?', "%#{search_params}%", false)
    elsif params[:tag]
      @works = Work.tagged_with(params[:tag])
    else
      @works = Work.all
      @artists = User.where(is_artist: true)
      @users = User.all
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
    params.require(:work).permit(:image, :style, :year, :title, :description, :price, :medium, :tag_list)
  end
end
