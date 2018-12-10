class Event < ApplicationRecord


	belongs_to :creator, :class_name => "User"
	has_many :attendees, :through => :event_attendees, :source => "attendee"
	has_many :event_attendees, :foreign_key => "attended_event_id", dependent: :destroy

	#scopes
	scope :upcoming, -> { where('date >= :now', {now: Time.now }) }
	scope :past, -> { where('date < :now', {now: Time.now}) } 

	validates :title, presence: true, length: { maximum: 75 }
	validates :location, presence: true, length: { maximum: 75 }
	validates :date, presence: true
	validate :date_cannot_be_past
		

	private
	
	def date_cannot_be_past
		if date.present? && date < Date.today
			errors.add(:date, "can not be in the past.")
		end		
	end	

	 
end
