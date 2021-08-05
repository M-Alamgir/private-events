# rubocop:disable Metrics/BlockLength
require 'rails_helper'

RSpec.describe Event, type: 'model' do
  before :each do
    @user = User.create(email: 'email@email.com')
    @event = @user.created_events.new(title: 'New Test', location: 'home', user_id: 1, time: '2021-04-10')
  end

  describe 'associations' do
    it 'belongs to creator' do
      expect(@event).to respond_to(:creator)
    end

    it 'has many attendances' do
      expect(@event).to respond_to(:attendances)
    end

    it 'has many attendees' do
      expect(@event).to respond_to(:attendees)
    end
  end

  it 'title should not be empty' do
    e = Event.new
    e.title = nil
    expect(e).to_not be_valid
  end

  it 'should not be empty' do
    e = Event.new
    e.title = 'New Title'
    e.time = Date.today
    e.location = 'xyz'
    e.user_id = 1
    expect(e).to_not be_valid
  end

  it 'location should not be empty' do
    e = Event.new
    e.location = nil
    expect(e).to_not be_valid
  end

  it 'Date should not be empty' do
    e = Event.new
    e.time = nil
    expect(e).to_not be_valid
  end

  it 'location should not be empty' do
    e = Event.new
    e.id = nil
    expect(e).to_not be_valid
  end
end
# rubocop:enable Metrics/BlockLength
