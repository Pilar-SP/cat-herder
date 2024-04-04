# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :project

  validates :name, presence: true
  validates :description, presence: true
  validates :priority, presence: true
end
