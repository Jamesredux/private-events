class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :destroy]
  before_action :admin_user, only: :destroy

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

  def index
    @users = User.paginate(page: params[:page])

    respond_to do |format|
      format.html #index.html.erb
      format.xml { render :xml => @users }
      format.json { render :json => @users}
    end 
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end



  private

  def user_params
  	params.require(:user).permit(:name, :email, :password,
  																:password_confirmation)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
