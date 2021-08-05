class Event < ApplicationRecord
  belongs_to :user
  belongs_to :creator, class_name: 'User', optional: true

  has_many :attendances, foreign_key: :attend_event_id
  has_many :attendees, through: :attendances

  def self.future_events
    where('time >= ?', Date.today)
  end

  def self.past_events
    where('time < ?', Date.today)
  end

  validates :title, presence: true
  validates :time, presence: true
  validates :location, presence: true
end
