class SearchController < ApplicationController
	respond_to :js, :html, :json
	def search
	  puts params
	  if params["query"].nil?
	    @using = []
	  else
	    a = User.ac_search(params["query"]).to_json
	   	d = Dish.ac_search(params["query"]).to_json
	   	
	  end
	  puts @using
	  render json: {users: a, dishes: d}
	end
end