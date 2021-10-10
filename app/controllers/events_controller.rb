# frozen_string_literal: true

class EventsController < ApplicationController # rubocop:todo Style/Documentation
  before_action :set_event, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    @events = Event.all.order('created_at DESC')
    @upcoming_events = Event.upcoming_events
    @past_events = Event.past_events
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to @event, notice: 'Your event was successfully created'
    else
      render 'new'
    end
  end

  def show_past
    @past_events = Event.past_events
  end

  def show_upcoming
    @upcoming_events = Event.upcoming_events
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :place, :date)
  end
end
