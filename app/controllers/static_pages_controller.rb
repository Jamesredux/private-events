class StaticPagesController < ApplicationController
  def home
  	if logged_in?
  		@events = Event.all 
			@upcoming_events = Event.upcoming
  	end	
  end

  def about
  end
end
