class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_filter :require_login, :except=>[]
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :null_session

  # around_filter :set_current_user

  # def set_current_user
  #   User.current_user = User.find_by_id(session[:user_id])
  #   yield
  # ensure
  #   # to address the thread variable leak issues in Puma/Thin webserver
  #   User.current_user = nil
  # end  

  def check_for_mobile
    session[:mobile_override] = params[:mobile] if params[:mobile]
  end

  def mobile_device?
    if session[:mobile_override]
      session[:mobile_override] == "1"
    else
      # Season this regexp to taste. I prefer to treat iPad as non-mobile.
      (request.user_agent =~ /Mobile|iP(hone|od)|Android|BlackBerry|IEMobile|Kindle|NetFront|Silk-Accelerated|(hpw|web)OS|Fennec|Minimo|Opera M(obi|ini)|Blazer|Dolfin|Dolphin|Skyfire|Zune/) && (request.user_agent !~ /iPad/)
    end
  end
  helper_method :mobile_device?

  
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