# frozen_string_literal: true

class CreatePrays < ActiveRecord::Migration[6.1]
  def change
    create_table :prays do |t|
      t.boolean :checked, default: false
      t.string :submitted_by
      t.string :pray

      t.timestamps
    end
  end
end
