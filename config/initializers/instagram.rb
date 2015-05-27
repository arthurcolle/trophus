require "instagram"


dev_client_id = "da3c354840064d44b6c81561424101b4"
dev_client_secret = "0eda5e2fd52d454e987bd38441b56c6b"
dev = [dev_client_id, dev_client_secret]
Instagram.configure do |config|
	config.client_id, config.client_secret = dev
end