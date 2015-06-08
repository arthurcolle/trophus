class SearchController < ApplicationController
	respond_to :js, :html, :json
	def search
	  puts params
	  if params["query"].nil?
	    @using = []
	  else
	  	beyond = User.beyond(15, :origin => current_user)
	  	puts "Beyond #{current_user.name}"
	  	puts beyond
	  	ids_not = []
	  	beyond.each { |dude| 
	  		ids_not.push(dude.id)
	  	}

	  	dishes_not = []
	  	ids_not.each {|id| 
	  		dishes = User.find(id).dishes
	  		dishes.each {|dish|
	  			dishes_not.push(dish.id)
	  		}
	  	}

	    a = User.ac_search(params["query"], without: { id: ids_not}).to_json
	    puts "Users returned"
	    puts a
	   	d = Dish.ac_search(params["query"], without: {id: dishes_not}).to_json
	   	puts "Dishes returned"
	   	puts d
	   	user_list = JSON.parse(a)
	   	dish_list = JSON.parse(d)
	   	listx = []

	   	ulist = []
	   	user_list.each {|u|
	   		uid = u["id"]
	   		uscore = u["_score"]
	   		uname = u["name"]
	   		pic = User.find(u["id"]).prof_pic
	   		item = {:type=>"user", :id => uid, :score => uscore, :name => uname, :pic => pic}
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
	   		pic = Dish.find(di["id"]).image_url
	   		item = {:type=> "dish", :id => did, :score => dscore, :name => dname, :description => ddesc, :price => dp, :pic => pic}
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