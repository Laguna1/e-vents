# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'Model validations' do
    it 'should have title' do
      event = Event.new(title: nil, place: 'Anywhere', date: Date.today).save
      expect(event).to eq(false)
    end

    it 'should have place' do
      event = Event.new(title: 'My Event', place: nil, date: Date.today).save
      expect(event).to eq(false)
    end

    it 'should have date' do
      event = Event.new(title: 'Nedw Event', place: 'Anywhere', date: nil).save
      expect(event).to eq(false)
    end
  end
end
