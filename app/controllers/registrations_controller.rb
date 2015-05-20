class RegistrationsController < Devise::RegistrationsController
  respond_to :html, :js

  	def edit_latlong
		@user = User.find(params["id"])
		@user.update(lat: params["lat"], long: params["long"] )
	    @user.save!
	end
end