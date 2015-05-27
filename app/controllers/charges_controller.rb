class ChargesController < ApplicationController
	def new
	end

	def create
		puts "ARTHURCOLLE"
		puts params

		customer = Stripe::Customer.create(
			:email => params["email"],
			:card => params["token"]
		)

		@user = User.find_by email: params["email"]
		@user.stripe_id = customer.id
		@user.save


		# puts "XYZ"
		# puts customer.id

	# rescue Stripe::CardError => e
	# 	flash[:error] = e.message
	# 	redirect_to charges_path
	end
end
