# frozen_string_literal: true

class UsersController < ApplicationController # rubocop:todo Style/Documentation
  def index
    @users = User.all
  end

  def show
    @upcoming = current_user.created_events.upcoming_events
    @past = current_user.created_events.past_events
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    redirect_to root_path if @user.save
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
