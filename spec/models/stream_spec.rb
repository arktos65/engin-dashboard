require 'rails_helper'

RSpec.describe Stream, type: :model do
  # Create the data object to be tested
  test_stream = FactoryBot.create(:stream)

  # Test the various conditions
  it "is valid with valid attributes" do
    expect(test_stream).to be_valid
  end
  it "is invalid without a source name" do
    test_stream.name = nil
    expect(test_stream).to_not be_valid
   end
end
