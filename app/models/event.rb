class Event < ApplicationRecord
	belongs_to :creator, :class_name => "User"
	has_many :event_attendees, :foreign_key => "attended_event_id"
	has_many :attendees, :through => :event_attendees, :source => "attendee"

	#scopes
	scope :upcoming, -> { where('date >= :now', {now: Time.now }) }
	scope :past, -> { where('date < :now', {now: Time.now}) } 

	validates :title, presence: true, length: { maximum: 75 }
	validates :location, presence: true, length: { maximum: 75 }
	validates :date, presence: true
	
	

	 
end
