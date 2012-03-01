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
  	
end
