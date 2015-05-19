class Dish < ActiveRecord::Base
	belongs_to :chef,
		:class_name => "User",
		:primary_key => "user_id"
end
