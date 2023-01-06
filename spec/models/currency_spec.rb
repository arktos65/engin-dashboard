require 'rails_helper'

RSpec.describe Currency, type: :model do
  # Create the data object to be tested
  test_currency = FactoryBot.create(:currency)

  # Test the various conditions
  it "is valid with valid attributes" do
    expect(test_currency).to be_valid
  end
  it "is not valid when name is missing" do
    test_currency.name = nil
    expect(test_currency).to_not be_valid
  end
  it "is not valid when code is missing" do
    test_currency.code = nil
    expect(test_currency).to_not be_valid
  end
end
