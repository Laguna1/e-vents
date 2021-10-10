# frozen_string_literal: true

class ChangeEventsUserToCreatorId < ActiveRecord::Migration[6.1] # rubocop:todo Style/Documentation
  def change
    rename_column :events, :user_id, :creator_id
  end
end
