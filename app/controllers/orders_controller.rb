class OrdersController < ApplicationController
  def order_from_cart
    cost = current_order.subtotal
    user_id = Dish.find(current_order.order_items.first.dish_id).user_id
    user = User.find(user_id)
    @amount = ((cost + 0.3*cost).ceil * 100).to_i
    charge = {
        :customer => current_user.customer_id,
        :amount => ((cost + 0.3*cost).ceil * 100).to_i,
        :destination => user.connect_id,
        :application_fee => ((0.3*cost).ceil * 100),
        :description => "[ Order " + current_order.id.to_s + " ]",
        :currency => 'usd'
    }

    charge = Stripe::Charge.create(charge)
    num = user.phone_number
    str = ""
    if num != nil
      str = "Call them at #{num}. "
    end
    str << "Email them at #{user.email}"
    redirect_to root_path, notice: "(You were charged $#{@amount.fdiv 100}) #{user.name} is your point of contact! #{str}"
    current_order.completed = true
    current_order.save
    session[:order_id] = nil
  end

  def show
  end

  def index
    Order.all
  end
end
