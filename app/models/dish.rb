class Dish < ActiveRecord::Base
	ac_field :name, search_fields: [:name, :description, :price]

	belongs_to :chef,
		:class_name => "User",
		:primary_key => "user_id"

	has_attached_file :image, styles: { small: "100x100", med: "200x200", large: "500x500" }
	do_not_validate_attachment_file_type :image

	def self.picture_from_url(url)
    	self.image = URI.parse(url).open
  	end
end
Dish.import