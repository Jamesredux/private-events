class StaticPagesController < ApplicationController
  def home
  	if logged_in?
  		@events = Event.all 
			@upcoming_events = Event.upcoming.order(:date).paginate(page: params[:page], per_page: 10)
  	end	
  end

  def about
  end
end
