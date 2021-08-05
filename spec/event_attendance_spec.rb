require 'rails_helper'

RSpec.describe Attendance, type: 'model' do
  describe 'associations' do
    it 'belongs to attendee' do 
      expect(belong_to(:attendee)).to be_truthy
    end

    it 'belongs to attend_event' do 
      expect(belong_to(:attend_event)).to be_truthy
    end
  end
end