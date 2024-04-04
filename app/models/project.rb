# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :tasks

  validates :name, presence: true
  validates :description, presence: true
  validates :priority, presence: true
end
