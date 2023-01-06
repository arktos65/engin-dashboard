require 'rails_helper'

RSpec.describe Role, type: :model do
  # Create the data object to be tested
  test_role = FactoryBot.create(:role)

  # Test the various conditions
  it "is valid with valid attributes" do
    expect(test_role).to be_valid
  end
end
