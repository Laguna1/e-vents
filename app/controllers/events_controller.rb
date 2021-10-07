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

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to event_path
    else
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :place, :date)
  end
end
