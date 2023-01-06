# frozen_string_literal: true

class Department < ApplicationRecord
  # Associations
  has_many :roles, dependent: :destroy

  # Validators
  validates_presence_of :name, :division
end
