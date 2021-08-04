class Attendance < ApplicationRecord
  belongs_to :attendee, class_name: 'User', optional: true
  belongs_to :attend_event, class_name: 'Event', optional: true
end
