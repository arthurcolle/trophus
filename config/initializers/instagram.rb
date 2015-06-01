require "instagram"

# dev_client_id = "da3c354840064d44b6c81561424101b4"
# dev_client_secret = "0eda5e2fd52d454e987bd38441b56c6b"
# dev = [dev_client_id, dev_client_secret]

# prod_client_id = "3bbefc95d4874e8799fc98f95617f481"
# prod_client_secret = "dbdaa0b824e443e3aa78e4bb812f33c8"
# prod = [prod_client_id, prod_client_secret]

Instagram.configure do |config|
	config.client_id, config.client_secret = ENV["INSTAGRAM_CLIENT"], ENV["INSTAGRAM_SECRET"]
end