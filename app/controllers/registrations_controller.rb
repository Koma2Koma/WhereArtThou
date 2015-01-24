class RegistrationsController < Devise::RegistrationsController

	

	private

	def sign_up_params
    params.require(:user).permit(:username, :email, 
                                     :password, :password_confirmation, 
                                     :current_password, :is_artist, artist_attributes: [:id, :twitter, :facebook, :instagram, :website, :tags, :about, :location, :user_id])
	end

	def account_update_params
		params.require(:user).permit(:username, :email, 
																 :password, :password_confirmation, 
																 :current_password, :is_artist, artist_attributes: [:id, :twitter, :facebook, :instagram, :website, :tags, :about, :location, :user_id])
	end

	protected

	def after_sign_up_path_for(user)
    if user.is_artist
    	user.artist.update_attributes(user_id: user.id)
    	artist_path(user.artist)
    else
    	user_path(user)
    end
  end


end



