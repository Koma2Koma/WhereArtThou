class WorksController < ApplicationController

  def index

    search_params = params[:search].downcase

    if search_params
      @works = Work.where('lower(title) LIKE ?', "%#{search_params}%")
      @artists = User.where('lower(username) LIKE ? AND is_artist = ?', "%#{search_params}%", true)
      @users = User.where('lower(username) LIKE ? AND is_artist = ?', "%#{search_params}%", false)
      
    else
      @works = Work.all
      @artists = User.where(is_artist: true)
      @users = User.all
    end


  end
end
