class UserSessionController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]	
  before_filter :require_user, :only => :destroy

	
  def new
  	@user_session = UserSession.new
  end
  
  def create
  	@user_session = UserSession.new(params[:user_session])
  	if @user_session.save
  		flash[:notice] = 'Successfully login'
  		redirect_back_or_default store_path
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
