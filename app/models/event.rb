# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendances, dependent: :destroy
  has_many :attendees, through: :attendances, source: :user

  scope :past_events, -> { where('date < ?', Date.today) }
  scope :upcoming_events, -> { where('date >= ?', Date.today) }
end
