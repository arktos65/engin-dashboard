require 'rails_helper'

RSpec.describe Team, type: :model do
  # Create data object to be tested
  test_team = FactoryBot.create(:team)

  # Test various conditions
  it "is valid with valid attributes" do
    expect(test_team).to be_valid
  end
end
