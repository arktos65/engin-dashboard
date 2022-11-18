require 'rails_helper'

RSpec.describe Source, type: :model do
  # Create the data object to be tested
  test_source = FactoryBot.create(:source)

  # Test the various conditions
  it "is valid with valid attributes" do
    expect(test_source).to be_valid
  end
  it "is invalid without a source name" do
    test_source.name = nil
    expect(test_source).to_not be_valid
  end
  it "is invalid without a contact name" do
    test_source.contact_name = nil
    expect(test_source).to_not be_valid
  end
  it "is invalid without a contact email address" do
    test_source.contact_email = nil
    expect(test_source).to_not be_valid
  end
end
