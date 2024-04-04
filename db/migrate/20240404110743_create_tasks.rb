# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.float :priority
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
