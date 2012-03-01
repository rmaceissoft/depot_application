class UserSessionController < ApplicationController
	
  def new
  	@user_session = UserSession.new
  end
  
  def create
  	@user_session = UserSession.new(params[:user_session])
  	if @user_session.save
  		flash[:notice] = 'Successfully login'
  		redirect_to store_path
  	else
  		render :action => 'new'
  	end
  end

  def destroy
  	@user_session = UserSession.find
  	@user_session.destroy
  	flash[:notice] = 'Successfully logout'
  	redirect_to store_path
  end
  
end
