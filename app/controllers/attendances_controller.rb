# frozen_string_literal: true

class AttendancesController < ApplicationController
  def join
    @attendance = Attendance.new(event_id: params[:id], user_id: current_user.id)

    if @attendance.save
      redirect_to events_path
    else
      redirect_to event_path
    end
  end
end
