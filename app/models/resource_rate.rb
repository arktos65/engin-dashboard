class ResourceRate < ApplicationRecord
  # Model associations
  belongs_to :member
  belongs_to :currency

  # Validators
  validates_presence_of :member, :currency
  validates_presence_of :base_rate, :fiscal_year
  validates_presence_of :classification, :rate_type

  validates :base_rate, numericality: { greater_than_or_equal_to: 0 }
  validates :weekly_rate, numericality: { greater_than_or_equal_to: 0 }
  validates :monthly_rate, numericality: { greater_than_or_equal_to: 0 }
  validates :annual_rate, numericality: { greater_than_or_equal_to: 0 }

  # Enumerators
  enum classification:  [:salary, :contractor, :bonus]
  enum rate_type: [:hourly, :weekly, :monthly, :annually]
end
