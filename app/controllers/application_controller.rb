class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  	helper_method :current_user_session, :current_user
	  
	private 
  
	def current_cart
  		Cart.find(session[:cart_id])
  	rescue ActiveRecord::RecordNotFound
  		cart = Cart.create
  		session[:cart_id] = cart.id
  		cart
  	end
  	
  	def current_user_session
  		return @current_user_session if defined?(@current_user_session)
  		@current_user_session = UserSession.find
  	end
  	
  	def current_user
  		return @current_user if defined?(@current_user)
  		@current_user = current_user_session && current_user_session.record
  	end
  	
  	
    def require_user
      logger.debug "ApplicationController::require_user"
      unless current_user
      	store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to login_path
        return false
      end
    end

    def require_no_user
      logger.debug "ApplicationController::require_no_user"
      if current_user
      	store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to edt_user_path
        return false
      end
    end
    
    def store_location
      session[:return_to] = request.fullpath
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
    
  	
  	
end
