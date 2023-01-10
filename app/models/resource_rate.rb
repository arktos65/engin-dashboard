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
  enum classification:  {
    employee: 0,
    contractor: 1,
    agency: 2
  }
  enum rate_type: {
    hourly: 0,
    weekly: 1,
    monthly: 2,
    annual: 3
  }

  # Callback to calculate rates from the base rate and rate type before
  # saving the record.
  before_save :calculate_rates

  # The base rate is used based on the rate type it is.  This method updates
  # weekly, monthly and annual rates based on the the value of the base rate and
  # the rate type.
  def calculate_rates
    case :rate_type
    when :hourly
      weekly_rate = base_rate * 40
      annual_rate = weekly_rate * 52
      monthly_rate = annual_rate / 12
    when :weekly
      weekly_rate = base_rate
      annual_rate = weekly_rate * 52
      monthly_rate = annual_rate / 12
    when :monthly
      monthly_rate = base_rate
      annual_rate = monthly_rate * 12
      weekly_rate = annual_rate / 52
    when :annual
      annual_rate = base_rate
      weekly_rate = annual_rate / 52
      monthly_rate = annual_rate / 12
    end
  end
end
