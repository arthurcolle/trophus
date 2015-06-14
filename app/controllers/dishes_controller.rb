class DishesController < ApplicationController
	before_action :authenticate_user!
	respond_to :html, :json, :js

	def new
    @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: 201, acl: :public_read)
    @dish = Dish.new
	end

	def multicreate
		puts "testing multicreate"
		urls = params['urls']
	    @dishes = urls.map{ |url| 
	    	Dish.create(
	    		:image_url => url, 
	    		:user_id => current_user.id
	    	) 
	   	}
	    respond_to do |format|
	    	format.js
	    end
	end

	def delete_unfinished
		Dish.all.each {|dish|
			if dish.name.nil? 
				dish.delete
			end
		}
		
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
		puts "FRANKENSTEIN"
		puts params["id"]
		@dish = Dish.find(params["id"])
		@dish.visible = false
		@dish.save()
	    redirect_to dishes_path, notice: 'Dish was successfully destroyed.'
	end

	def update
		@dish = Dish.find(params["id"])
	  	if @dish.update(dish_params)
	    	redirect_to dishes_path, notice: 'Dish was successfully updated.'
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
    def dish_params
    	if !params["image_url"].nil?
			params["image"] = Dish.picture_from_url(params["image_url"])
		end
    	params.require(:dish).permit(:name, :description, :price, :image, :image_url, :direct_image_url)
    end
end