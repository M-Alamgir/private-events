class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events

  has_many :attended, foreign_key: "attendee_id", class_name: "Attendance"
  has_many :attended_events, through: :attended
end
