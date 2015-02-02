class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(user)
    if user.is_artist
      artist = Artist.find_by(user_id: user.id)
      artist_path(artist)
    elsif user.is_venue
      venue = Venue.find_by(user_id: user.id)
      venue_path(venue)
    else
      user_path(user)
    end
  end
end

class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :current_password, :picture, :is_artist, :is_venue) }
  end
end


