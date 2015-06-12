class Order < ActiveRecord::Base
  # belongs_to :seller,
  #            :class_name => "User",
  #            :primary_key => "seller_id"
  #
  # belongs_to :buyer,
  #            :class_name => "User",
  #            :primary_key => "buyer_id"

  belongs_to :buyer, class_name: 'User'
  belongs_to :seller, class_name: 'User'

  has_many :reviews,
           :class_name => "OrderReview"


  belongs_to :order_status
  has_many :order_items
  before_create :set_order_status, :set_users
  before_save :update

  def subtotal
    order_items.collect { |oi|
      puts oi.inspect
      oi.valid? ? (oi.quantity * oi.unit_price) : 0
    }.sum
  end

private
  def set_users

  end
  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end

  def update
    update_subtotal
    self[:components] = order_items.to_json
  end
end