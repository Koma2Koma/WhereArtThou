class WorksController < ApplicationController

  def index

    if params[:search]
      @works = Work.where('title LIKE ?', "%#{params[:search]}%")
    else
      @works = Work.all
    end

    
  end
end
