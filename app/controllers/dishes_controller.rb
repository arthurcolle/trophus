class DishesController < ApplicationController
	before_action :authenticate_user!
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

	def order
		@dish = Dish.find(params["id"])
		@amount = ((@dish.price + 0.3*@dish.price).ceil * 100).to_i
		charge = {
			:customer => current_user.customer_id, 
			:amount => ((@dish.price + 0.3*@dish.price).ceil * 100).to_i,
			:destination => User.find(@dish.user_id).connect_id,
			:application_fee => ((0.3*@dish.price).ceil * 100),
			:description => "[" + @dish.name + "]: " + "(" + @dish.description + ")",
			:currency => 'usd'
		}

		charge = Stripe::Charge.create(charge)

		num = User.find(@dish.user_id).phone_number
		str = ""
		if num != nil
			str = "Call them at #{num}. "
		end
		str << "Email them at #{User.find(@dish.user_id).email}"
		redirect_to @dish, notice: "(You were charged $#{@amount.fdiv 100}) #{User.find(@dish.user_id).name} is your point of contact! #{str}"
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