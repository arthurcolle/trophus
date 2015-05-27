class DishesController < ApplicationController
	def new
		@dish = Dish.new
	end

	def show
		@dish = Dish.find(params["id"])
	end

	def index
		@dishes = current_user.dishes
	end

	def create
	    @dish = current_user.dishes.create(dish_params)
	    if current_user
	      if @dish.save()
	      	redirect_to dishes_path, notice: "Dish was created!"
	      else
	      	redirect_to dishes_path, notice: "Dish failed!"
	      	render :new
	      end
	    end
  	end

	def edit
		@dish = Dish.find(params["id"])
	end

	def destroy
		@dish = Dish.find(params["id"])
		@dish.destroy
	    redirect_to dishes_path, notice: 'Dish was successfully destroyed.'
	end

	def update
		@dish = Dish.find(params["id"])
	  	if @dish.update(dish_params)
	    	redirect_to @dish, notice: 'Dish was successfully updated.'
	    else
	      render :edit
	    end
	end

	private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def dish_params
    	if !params["image_url"].nil?
			params["image"] = Dish.picture_from_url(params["image_url"])
		end
    	params.require(:dish).permit(:name, :description, :price, :image, :image_url)
    end
end