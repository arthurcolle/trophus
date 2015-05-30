class SearchController < ApplicationController
	respond_to :js, :html, :json
	def search
	  puts params
	  if params["query"].nil?
	    @using = []
	  else
	    a = User.ac_search(params["query"]).to_json
	   	d = Dish.ac_search(params["query"]).to_json

	   	user_list = JSON.parse(a)
	   	dish_list = JSON.parse(d)
	   	listx = []

	   	ulist = []
	   	user_list.each {|u|
	   		uid = u["id"]
	   		uscore = u["_score"]
	   		uname = u["name"]
	   		item = {:type=>"user", :id => uid, :score => uscore, :name => uname}
	   		ulist.push(item)
	   		listx.push(item)
	   	}

	   	dlist = []
	   	dish_list.each {|di|
	   		dname = di["name"]
	   		did = di["id"]
	   		ddesc = di["description"]
	   		dscore = di["_score"]
	   		dp = di["price"]
	   		item = {:type=> "dish", :id => did, :score => dscore, :name => dname, :description => ddesc, :price => dp}
	   		dlist.push(item)
	   		listx.push(item)

	   	}

	   	listy = listx.sort_by{|h| h["score"]}
	   	puts listy

	   	
	  end
	  puts @using
	  render json: {suggestions: listy}
	end
end