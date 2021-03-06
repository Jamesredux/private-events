# README

Done as part of Odin Project.

My notes

Some changes.  I did not add feature where you can invite other people, I did not see the point.
It would annoy me to get invited. I might add this feature if I come back and add to this.
I would want to make it so that users can be friends with each other. Then you can invite people in your friends list.

Destroy Dependancies.
If an event is cancelled then all the attendees are deleted but if a user is deleted the event is not automatically cancelled. 

Admin:

I added admin attribute to the users model. 
When an admin is logged in then he/she has a link to a list of users and can delete any user.
A before_action is added to users controller to double check only admin users can destroy users.
They also have the ability to delete events from the events page. (A delete link is shown to only admin users)


To do:
refactor
testing?
tidy website


https://www.theodinproject.com/courses/ruby-on-rails/lessons/associations


Project 2: Private Events
You want to build a site similar to a private Eventbrite which allows users to create events and then manage user signups. Users can create events and send invitations and parties (sound familiar?). Events take place at a specific date and at a location (which you can just store as a string, like “Andy’s House”).

A user can create events. A user can attend many events. An event can be attended by many users. This will require you to model many-to-many relationships and also to be very conscious about your foreign keys and class names (hint: you won’t be able to just rely on Rails’ defaults like you have before).

Your Task
We’ve gotten quite far here, so these tasks will only lay out the high level overview of what you’re meant to build. You’ll need to implement the details yourself. As usual, it’s not meant to look pretty, just work. Design is all extra credit.

Setup and Sign In
Model the data for your application, including the necessary tables.

Create a new Rails application and Git repo called private-events.

Update your README to be descriptive and link to this project.

Build and migrate your User model. Don’t worry about validations.

Create a simple Users controller and corresponding routes for #new, #create, and #show actions. You’ll need to make a form where you can sign up a new user and a simple #show page. You should be getting better and faster at this type of vanilla controller/form/view building.

Create a simple sign in function that doesn’t require a password – just enter the ID or name of the user you’d like to “sign in” as and click Okay. You can then save the ID of the “signed in” user in either the session hash or the cookies hash and retrieve it when necessary. It may be helpful to always display the name of the “signed in” user at the top.

Basic Events

Build and migrate your Event model without any foreign keys. Don’t worry about validations. Include the event’s date in your model but don’t worry about doing anything special with it yet.

Add the association between the event creator (a User) and the event. Call this user the “creator”. 

Add the foreign key to the Events model as necessary. You’ll need to specify your association properties carefully (e.g. :foreign_key, :class_name, and :source).

Modify your User’s Show page to list all the events a user has created.

Create an EventsController and corresponding routes to allow you to create an event (don’t worry about editing or deleting events), show a single event, and list all events.

The form for creating an event should just contain a :description field.

The #create action should use the #build method of the association to create the new event with the user’s ID prepopulated. You could easily also just use Event’s ::new method and manually enter the ID but… don’t.

The event’s Show page should just display the creator of the event for now.

Create the Event Index page to display all events.

Event Attendance

Now add the association between the event attendee (also a User) and the event. Call this user the “attendee”. Call the event the “attended_event”. You’ll again need to juggle specially named foreign keys and classes and sources.

Create and migrate all necessary tables and foreign keys. This will require a “through” table since an 

Event can have many Attendees and a single User (Attendee) can attend many Events… many-to-many.

Now make an Event’s Show page display a list of attendees.

Make a User’s Show page display a list of events they are attending.

Modify the User’s Show page to separate those events which have occurred in the past (“Previously attended events”) from those which are occuring in the future (“Upcoming events”). You could do this by putting logic in your view. Don’t. Have your controller call separate model methods to retrieve each, e.g. @upcoming_events = current_user.upcoming_events and @prev_events = current_user.previous_events. You’ll get some practice with working with dates as well as building some queries.

Modify the Event Index page to list all events, separated into Past and Upcoming categories. Use a class method on Event (e.g. Event.past).

Refactor the “upcoming” and “past” methods into simple scopes (remember scopes??).

Put navigation links across the top to help you jump around.

Extra Credit: Allow users to invite other users to events. Only allow invited users to attend an event.

Push to Github.
