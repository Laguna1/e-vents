# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @events = Event.all.order('created_at DESC')
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
  end
end
