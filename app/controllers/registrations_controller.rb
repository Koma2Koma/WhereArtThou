class RegistrationsController < Devise::RegistrationsController

	

	private

	def sign_up_params
		params.require(:user).permit(:username, :email, 
																 :password, :password_confirmation, :is_artist)
	end

	def account_update_params
		params.require(:user).permit(:username, :email, 
																 :password, :password_confirmation, 
																 :current_password, :is_artist)
	end

	protected

	def after_sign_up_path_for(user)
    if user.is_artist
    	Artist.create!(user_id: user.id)
    	user_path(user)
    else
    	root_path
    end
  end  

end