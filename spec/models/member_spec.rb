require 'rails_helper'

RSpec.describe Member, type: :model do
  test_member = FactoryBot.create(:member)

  # Test the various conditions
  it "is valid with valid attributes" do
    expect(test_member).to be_valid
  end
end
