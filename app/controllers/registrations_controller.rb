class RegistrationsController < Devise::RegistrationsController

	

	private

	def sign_up_params
    params.require(:user).permit(:username,
                                 :email,
                                 :password,
                                 :password_confirmation,
                                 :current_password, 
                                 :is_artist, 
                                 :is_venue, 
                                artist_attributes: 
                                [:id, 
                                  :twitter, 
                                  :facebook, 
                                  :instagram, 
                                  :website, 
                                  :tags, 
                                  :about, 
                                  :location, 
                                  :user_id,],
                                venue_attributes: 
                                  [:id, 
                                    :name, 
                                    :address, 
                                    :city, 
                                    :state, 
                                    :phone, 
                                    :description, 
                                    :twitter, 
                                    :facebook, 
                                    :instagram, 
                                    :website, 
                                    :picture, 
                                    :email, 
                                    :contact])
  end                                                   


	def account_update_params
		params.require(:user).permit(:username, 
                                 :email, 
																 :password,
                                 :password_confirmation, 
																 :current_password,
                                 :is_artist,
                                 :is_venue,
                                artist_attributes:
                                  [:id, 
                                   :twitter, 
                                   :facebook, 
                                   :instagram, 
                                   :website, 
                                   :tags, 
                                   :about, 
                                   :location, 
                                   :user_id],
                                venue_attributes:
                                  [:id,
                                   :name,
                                   :address,
                                   :city,
                                   :state,
                                   :phone,
                                   :description,
                                   :twitter,
                                   :facebook,
                                   :instagram,
                                   :website,
                                   :picture,
                                   :email,
                                   :contact,
                                   :user_id])

  end

	protected

	def after_sign_up_path_for(user)
    if user.is_artist
    	user.artist.update_attributes(user_id: user.id)
    	artist_path(user.artist)
    elsif user.is_venue
      user.venue.update_attributes(user_id: user.id)
      venue_path(user.venue) 
    else
    	user_path(user)
    end
  end


end



