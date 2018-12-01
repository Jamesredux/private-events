class EventsController < ApplicationController

	def show
		@event = Event.find(params[:id])
	end

	def index
		@events = Event.all.paginate(page: params[:page], per_page: 5)
	end

	def new
		@event = Event.new
	end

	def create
		@event =  current_user.created_events.build(event_params)
		if @event.save
		 redirect_to root_url
		else
			render 'new' 
		end	
	end

	private

	private

	def event_params
		params.require(:event).permit(:title, :location, :date)
	end	

end
