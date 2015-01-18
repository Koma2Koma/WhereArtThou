class WorksController < ApplicationController

  def index

    if params[:search]
      @works = Work.where('title LIKE ?', "%#{params[:search]}%")
    else
      @works = Work.all
    end

    redirect_to about_path
  end
end
