class UsersController < ApplicationController
	respond_to :html, :json

	def connect
		respond_to do |format|
			format.js
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def inbox
	end

	def login
	    @user = User.koala(request.env['omniauth.auth']['credentials'], current_user.id)
	    @user = current_user
	    render 'users/show'
    end

    def get_notif_count
    	@notifs = User.find(current_user.id).mailbox.notifications(:read => false).length
    	puts @notifs
    	respond_to do |format|
    		format.js
    	end
    end

	def create_connected
		puts params
		@user = current_user
		account = Stripe::Account.retrieve(@user.connect_id)
		account.bank_account = params["token"]
		account.legal_entity.first_name = params["first_name"]
		account.legal_entity.last_name = params["last_name"]
		account.legal_entity.dob.year = params["dob1"].to_i
		account.legal_entity.dob.month = params["dob2"].to_i
		account.legal_entity.dob.day = params["dob3"].to_i
		account.legal_entity.type = "sole_prop"
		account.tos_acceptance.date = Time.now.to_i
		account.tos_acceptance.ip = request.remote_ip
		account.save
		@user.transfers_enabled = true
		@user.save

		respond_to do |format|
			format.js
		end
	end

	def accepted_tos
		@user = current_user
		puts @user.name
		@country = params["country"]
		@tos = params["tos"]

		if @user.connect_id.nil?
			connect = Stripe::Account.create({
			    :country => @country,
			    :managed => true,
			    :email => @user.email
		  	})
			@user.connect_id = connect["id"] 							# STRIPE CONNECT ID   -   acct_1679LjFP9ocVaMqO
			@user.secret_id = connect["keys"]["secret"] 				# STRIPE CONNECT SECRET ID   -   sk_test_MVrRKSz1xZM1g2Dwnzxf8x9E
			@user.publishable_id = connect["keys"]["publishable"]       # STRIPE CONNECT PUBLISHABLE ID   -   pk_test_FDc3ZDS37tv3UPF1Wqfyz2Nf
			@user.save
		end

		@connect_id = @user.connect_id
		@secret_key = @user.secret_id
		@publishable_key = @user.publishable_key

		respond_to do |format|
			format.js
		end
	
	end
	
	def edit_latlong
		respond_to do |format|   
			format.json {      # listen for json post request
				@user = User.find(params["id"])
				@user.update(lat: params["lat"], long: params["long"] )
				@user.update(lat_f: params["lat"].to_f, long_f: params["long"].to_f )
	        	@user.save
			    head :no_content # Send a no response to whoever sent the post.
			}
			format.html {
				# Normal form post request (form_for or w.e.)
			}
		end
	end

	def dishes
		@user = User.find(params["id"])
		@dishes = @user.dishes
    @order_item = current_order.order_items.new

		respond_to do |format|
	    	format.js
	    	format.html
	  	end
  end

  def temp_location
    puts "testing location"
    @location = params["location"]
    puts @location
    respond_to do |format|
      format.html
    end
  end

	def user_recent_media
		@client = Instagram.client(:access_token => session[:access_token])
        response = @client.user_recent_media
        @user = @client.user
        album = [].concat(response)
        max_id = response.pagination.next_max_id

        while !(max_id.to_s.empty?) do
            response = @client.user_recent_media(:max_id => max_id)
            max_id = response.pagination.next_max_id
            album.concat(response)
        end
        @album = album
        
        respond_to do |format|
        	format.js
        end
	end

	def user_recent_media_single
		@client = Instagram.client(:access_token => session[:access_token])
        response = @client.user_recent_media
        @user = @client.user
        album = [].concat(response)
        max_id = response.pagination.next_max_id

        while !(max_id.to_s.empty?) do
            response = @client.user_recent_media(:max_id => max_id)
            max_id = response.pagination.next_max_id
            album.concat(response)
        end
        @album = album
        
        respond_to do |format|
        	format.js
        end	
	end
	
	def prof_pic_change
		puts "Checking profile picture change and create"
		current_user.prof_pic = params['imageURL']
		if current_user.save 
			redirect_to root_path, notice: "Image uploaded!"
		else
			redirect_to root_path, notice: "Upload failed!"
		end
	end


	def user_recent_media_single_prof
		@client = Instagram.client(:access_token => session[:access_token])
        response = @client.user_recent_media
        @user = @client.user
        album = [].concat(response)
        max_id = response.pagination.next_max_id

        while !(max_id.to_s.empty?) do
            response = @client.user_recent_media(:max_id => max_id)
            max_id = response.pagination.next_max_id
            album.concat(response)
        end
        @album = album
        
        respond_to do |format|
        	format.js
        end	
	end


	def jsonify
		respond_to do |format|   
			format.json {      # listen for json post request
				@user = User.find(params["id"])
				json = Jsonify::Builder.new(:format => :pretty)
				json.person do
					json.name @user.name
					json.email @user.email
					json.home @user.home
					json.lat @user.lat
					json.long @user.long
					json.id @user.id
					json.prof_pic @user.prof_pic
				end
				render :json => json.compile!
			}
			format.html {
				# Normal form post request (form_for or w.e.)
			}
		end
	end

	def get_ids
		ids = []
		User.all.each {|u|
			ids.push(u.id)
		}
		respond_to do |format|
			format.json {
				render json: ids.to_json
			}
			format.html {

			}
		end
	end
	
    private
   		def user_params
      		params.require(:user).permit(:id, :name, :email, :phone_number, :home, :password, :lat, :long, :address_line_1, :address_line_2, :address_zip, :address_city, :address_state)
      	end
end