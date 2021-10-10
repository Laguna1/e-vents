# frozen_string_literal: true

class AddNameToUsers < ActiveRecord::Migration[6.1] # rubocop:todo Style/Documentation
  def change
    add_column :users, :name, :string
  end
end
