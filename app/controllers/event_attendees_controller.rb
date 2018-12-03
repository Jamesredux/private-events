class EventAttendeesController < ApplicationController


	def new
		@event_attendee =  EventAttendee.new
	end

	def create
		@event = Event.find(params[:id])
		@event.attendees << current_user

	end
end
