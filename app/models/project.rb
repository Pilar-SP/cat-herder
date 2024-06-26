# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy

  validates :name, :description, :priority, presence: true
end
