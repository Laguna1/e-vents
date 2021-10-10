# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[6.1] # rubocop:todo Style/Documentation
  def change
    create_table :events do |t|
      t.string :title
      t.string :place
      t.datetime :date

      t.timestamps
    end
  end
end
