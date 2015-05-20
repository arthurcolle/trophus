class UsersController < ActionController::Base
	def edit_latlong
		respond_to do |format|   
			format.json {      # listen for json post request
				@user = User.find(params["id"])
				@user.update(lat: params["lat"], long: params["long"] )
	        	@user.save
			    head :no_content # Send a no response to whoever sent the post.
				
			}
			format.html {
				# Normal form post request (form_for or w.e.)
			}
		end
	end
	
    private
   		def user_params
      		params.require(:user).permit(:id, :name, :email, :home, :password, :lat, :long)
      	end
end