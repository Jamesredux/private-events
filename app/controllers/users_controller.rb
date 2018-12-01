class UsersController < ApplicationController
  

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
    @created_events =  @user.created_events.paginate(page: params[:page], per_page: 5)
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
