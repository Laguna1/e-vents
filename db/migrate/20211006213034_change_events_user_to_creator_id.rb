# frozen_string_literal: true

class ChangeEventsUserToCreatorId < ActiveRecord::Migration[6.1]
  def change
    rename_column :events, :user_id, :creator_id
  end
end
