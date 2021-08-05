require 'rails_helper'

describe User do
  describe 'with events' do
    it 'varifies that user created this event' do
      @user = User.new(email: 'user@user.com')
      event = @user.created_events.new(title: 'first comment',
                                       location: 'oljdsa',
                                       time: '10-12-2020')
      expect(@user.id).to eql(event.user_id)
    end
  end
end

RSpec.describe User, type: :model do
  let(:user) { User.new(email: 'xyz@new.com') }
  let(:created_events) do
    Event.new(title: 'New Test',
              location: 'home',
              user_id: 1, date: '2021-04-10')
  end
  let(:attendances) { Attendance.new(attendee_id: 1, attend_event_id: 1) }

  describe 'associations' do
    it 'has many events' do
      expect(user).to respond_to(:created_events)
    end

    it 'has many attendances' do
      expect(user).to respond_to(:attendances)
    end

    it 'has many attended_events' do
      expect(user).to respond_to(:attend_events)
    end
  end

  describe 'validations' do
    it 'User must have password' do
      expect(user).to_not be_valid
    end

    it 'password required' do
      user.email = nil
      expect(user).to_not be_valid
    end
  end
end
