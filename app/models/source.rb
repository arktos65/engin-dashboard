# frozen_string_literal: true

class Source < ApplicationRecord
  # Associations
  #has_many :members

  # Validators
  validates_presence_of :name, :contact_name, :contact_email
end
