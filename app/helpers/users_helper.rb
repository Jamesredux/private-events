module UsersHelper

def upcoming_attended_events(user)
	#@attended_events = @user.attended_events
	upcoming_events = @attended_events.upcoming.paginate(page: params[:page], per_page: 5)
end

def past_attended_events(user)
	#@attended_events = @user.attended_events
	past_events = @attended_events.past.paginate(page: params[:page], per_page: 5)
end

def upcoming_created_events(user)
	upcoming_events = @created_events.upcoming.paginate(page: params[:page], per_page: 5)
end

def past_created_events(user)
	past_events = @created_events.past.paginate(page: params[:page], per_page: 5)
end

def current_user?(user)
	current_user == user
end

end
