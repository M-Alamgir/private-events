class Event < ApplicationRecord
	belongs_to :user

	has_many :attendances, foreign_key: :attend_event_id
	has_many :attendees, through: :attendances

	def self.future_events
		where('time >= ?', Date.today)
	end

	def self.past_events
		where('time < ?', Date.today)
	end
end
