require 'rails_helper'

RSpec.describe ResourceRate, type: :model do
  # Create data object to test
  test_rate = FactoryBot.create(:resource_rate)

  # Test the various conditions
  context 'validating presence of' do
    it 'is valid with valid attributes' do
      expect(test_rate).to be_valid
    end
    it 'is not valid without a base rate value' do
      test_rate.base_rate = nil
      expect(test_rate).to_not be_valid
    end
    it 'is not valid without a fiscal year' do
      test_rate.fiscal_year = nil
      expect(test_rate).to_not be_valid
    end
  end

  context 'validating associations with other entities' do
    it 'is not valid without an associated member' do
      test_rate.member_id = nil
      expect(test_rate).to_not be_valid
    end
    it 'is not valid without an associated currency' do
      test_rate.currency_id = nil
      expect(test_rate).to_not be_valid
    end
  end

  context 'validating data types and value ranges' do
    it 'must have a base rate greater than zero' do
      test_rate.base_rate = -5
      expect(test_rate).to_not be_valid
    end
    it 'must have a weekly rate greater than zero' do
      test_rate.weekly_rate = -5
      expect(test_rate).to_not be_valid
    end
    it 'must have a monthly rate greater than zero' do
      test_rate.monthly_rate = -5
      expect(test_rate).to_not be_valid
    end
    it 'must have a annual rate greater than zero' do
      test_rate.annual_rate = -5
      expect(test_rate).to_not be_valid
    end
  end
end
