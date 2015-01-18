class WorksController < ApplicationController

  def index

    if params[:search]
      @works = Work.where('title LIKE ?', "%#{params[:search]}%")
      @artists = User.where('username LIKE ? AND is_artist = ?', "%#{params[:search]}%", true)
      @users = User.where('username LIKE ? AND is_artist = ?', "%#{params[:search]}%", false)
      
    else
      @works = Work.all
    end


  end
end
