class EventsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
	
	def show
		@event = Event.find(params[:id])
		@attendees =  @event.attendees.all.paginate(page: params[:page], per_page: 12)
	end

	def index
		@events = Event.all 
		@past_events = Event.past
		@upcoming_events = Event.upcoming
	end 

	def new
		@event = Event.new
	end

	def create
		@event =  current_user.created_events.build(event_params)
		if @event.save
			flash[:success] = "New event created"
			if attendee_checked?
			 @event.event_attendees.create(:attendee_id => current_user.id)
			end	
		 redirect_to @event
		else
			render 'new' 
		end	
	end

	def destroy
    Event.find(params[:id]).destroy
    flash[:success] = "Event deleted"
    redirect_to events_url
	end

	def update
		if attendee_checked?
			add_attendee
		else
			redirect_back fallback_location: events_url
		end	
	end



	private

	def event_params
		params.require(:event).permit(:title, :location, :date)
	end	

	def attendee_checked?
		params[:event][:attendees] == '1'
	end

	def add_attendee
		@event = Event.find(params[:id])
		if current_user.attended_event_ids.include?(@event.id)
			flash[:danger] = "You are already attending this event"
			redirect_to @event
		elsif @event.date < Time.now
			flash[:danger] = "That event has finished. You can not be added to the attendees."
			redirect_to @event
					
		else	
			@event.attendees << current_user
			flash[:success] = "Your name have been added to the guestlist."
			redirect_to @event
		end	
	end



end
