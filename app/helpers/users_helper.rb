module UsersHelper

def upcoming_events(user)
	@attended_events = @user.attended_events
	upcoming_events = @attended_events.upcoming.paginate(page: params[:page], per_page: 5)
end

def past_events(user)
	@attended_events = @user.attended_events
	past_events = @attended_events.past.paginate(page: params[:page], per_page: 5)
	
end


end
