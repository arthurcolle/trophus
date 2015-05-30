class SearchController < ApplicationController
	def search
		puts params
	  if params[:query].nil?
	    @returned = []
	  else
	    @dish_data = Dish.ac_search params[:q]
	    @user_data = User.ac_search params[:q]
	  end
	  render_to do |format|
	  	format.js
	  end
	end
end