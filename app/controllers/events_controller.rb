# frozen_string_literal: true

class EventsController < ApplicationController # rubocop:todo Style/Documentation
  before_action :set_event, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    @events = Event.all.order('created_at DESC')
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
    @event.save
    if @event.save
      redirect_to @event, notice: 'Your event was successfully created'
    else
      render 'new'
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :place, :date)
  end
end
