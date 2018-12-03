class UsersController < ApplicationController
  include UsersHelper

  def create
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
      flash[:success] =  "Welcome to Private Events"
  		redirect_to root_url
  	else
  		render 'new'
  	end			
  end

  def show
  	@user = User.find(params[:id])
    @created_events =  @user.created_events
    @attended_events  = @user.attended_events
    @upcoming_created_events = upcoming_created_events @user
    @past_created_events = past_created_events @user
    @upcoming_attended_events = upcoming_attended_events @user 
    @past_attended_events = past_attended_events @user
   

  end


  def new
  	@user = User.new
  end


  private

  def user_params
  	params.require(:user).permit(:name, :email, :password,
  																:password_confirmation)
  end
end
