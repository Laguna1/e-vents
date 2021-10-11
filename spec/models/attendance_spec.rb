# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Attendance, type: :model do
  context 'Associations' do
    it 'should have foreign key user_id' do
      attendance = Attendance.reflect_on_association(:user)
      expect(attendance.foreign_key).to eq('user_id')
    end

    it 'should have foreign key event_id' do
      attendance = Attendance.reflect_on_association(:event)
      expect(attendance.foreign_key).to eq('event_id')
    end

    it 'should have user and event' do
      @user = User.create(name: 'Oksana', email: 'oksana@mail.com', password: '111111')
      @event = @user.created_events.create(title: 'Event', place: 'There', date: Date.today)
      @attendance = Attendance.create(user_id: @user.id, event_id: @event.id)

      expect(Attendance.first.user).to  eq(@user)
      expect(Attendance.first.event).to eq(@event)
    end
  end
end
