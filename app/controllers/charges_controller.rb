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

		@user = User.where(:users => {:email => params["email"]})[0]

		connect = Stripe::Account.create(
		  {
		    :country => "US",
		    :managed => true,
		    :email => params["email"]
		  }
		)

		@user.customer_id = customer.id
		@user.connect_id = connect["id"]
		@user.secret_id = connect["keys"]["secret"]
		@user.publishable_id = connect["keys"]["publishable"]
		@user.save

		# account = Stripe::Account.retrieve({CONNECTED_STRIPE_ACCOUNT_ID})

		# # Create additional owners
		# account.legal_entity.additional_owners = [
		#   {:first_name => 'Bob', :last_name => 'Smith'},
		#   {:first_name => 'Jane', :last_name => 'Doe'}
		# ]

		# # Add an additional owner
		# length = account.legal_entity.additional_owners.length
		# account.legal_entity.additional_owners[length] = {
		#   :first_name => 'Andrew',
		#   :last_name => 'Jackson'
		# }

		# # Update additional owners
		# account.legal_entity.additional_owners[0].first_name = 'Robert'

		# # Indicate that there are no additional owners
		# account.legal_entity.additional_owners = ''

		# account.save

		# # account = Stripe::Account.retrieve({CONNECTED_STRIPE_ACCOUNT_ID})
		# # account.tos_acceptance.date = Time.now.to_i
		# # account.tos_acceptance.ip = request.remote_ip # Assumes you're not using a proxy
		# account.save



		puts @user


		# puts "XYZ"
		# puts customer.id

	# rescue Stripe::CardError => e
	# 	flash[:error] = e.message
	# 	redirect_to charges_path
	end
end
