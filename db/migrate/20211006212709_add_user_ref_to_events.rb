# frozen_string_literal: true

class AddUserRefToEvents < ActiveRecord::Migration[6.1] # rubocop:todo Style/Documentation
  def change
    add_reference :events, :user, foreign_key: true
  end
end
