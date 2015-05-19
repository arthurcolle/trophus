class DishesController < ApplicationController
	def new
		@dish = Dish.new
	end

	def show
		@dish = Dish.find(params["id"].to_s)
	end

	def index
		my_dishes = []
		Dish.all.each { |dish|
			if dish.user_id == current_user.id
				my_dishes.push(dish)
			end
		}
		@dishes = my_dishes
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
	end

	def destroy
		@dish.destroy
	    redirect_to dishes_path, notice: 'Dish was successfully destroyed.'
	end

	def update
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
    	params.require(:dish).permit(:name, :description, :price)
    end
end