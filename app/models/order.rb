class Order < ActiveRecord::Base
	belongs_to :seller,
		:class_name => "User",
		:primary_key => "seller_id"

	belongs_to :buyer,
		:class_name => "User",
		:primary_key => "buyer_id"

	has_many :reviews,
		:class_name => "OrderReview"
	
end