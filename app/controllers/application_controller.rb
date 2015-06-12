class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_filter :require_login, :except=>[]
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :null_session
  helper_method :current_order

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new(buyer_id: current_user.id)
    end
  end
  # around_filter :set_current_user

  # def set_current_user
  #   User.current_user = User.find_by_id(session[:user_id])
  #   yield
  # ensure
  #   # to address the thread variable leak issues in Puma/Thin webserver
  #   User.current_user = nil
  # end  

  rescue_from ActiveRecord::RecordNotFound do
    # flash[:warning] = 'Resource not found.'
    redirect_back_or root_path
  end
 
  def redirect_back_or(path)
    redirect_to request.referer || path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| 
      u.permit(:name, :home, :email, :phone_number, :lat, :long, :address_line_1, :address_line_2, :address_zip, :address_city, :address_state, :password, :remember_me) 
    }
    
    devise_parameter_sanitizer.for(:sign_in) { |u| 
      u.permit(:login, :username, :email, :password, :remember_me) 
    }
    
    devise_parameter_sanitizer.for(:account_update) { |u| 
      u.permit(:name, :home, :email, :password, :password_confirmation, :current_password) 
    }
  end
end