class OauthController < ActionController::Base

	CALLBACK_URL = ENV["APP_URL"] +'/users/auth/instagram/callbacks'
	CALLBACK_URL = "http://trophus.herokuapp.com/users/auth/instagram/callbacks"

	SCOPE = "likes+comments+relationships"

	def connect
		redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
	end

	def auth
		response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
		session[:access_token] = response.access_token
		redirect_to "/dishes/new"
	end
end
