require 'rails_helper'

RSpec.describe JiraUser, type: :model do
  # Create data object for testing
  test_juser = FactoryBot.create :jira_user

  # Test various conditions
  it "is valid with valid attributes" do
    expect(test_juser).to be_valid
  end
  it "is not valid without account id" do
    test_juser.account_id = nil
    expect(test_juser).to_not be_valid
  end
end
