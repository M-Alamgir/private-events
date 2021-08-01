class Event < ApplicationRecord
	belongs_to :user

	has_many :user_attending, foreign_key: "attend_event_id", class_name: "Attendance"
	has_many :attending, through: :user_attending
end
