# frozen_string_literal: true

class Department < ApplicationRecord
  # Validators
  validates_presence_of :name, :division
end
