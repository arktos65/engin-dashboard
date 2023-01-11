require 'rails_helper'

RSpec.describe JiraIssue, type: :model do
  # Create data object for testing
  test_issue = FactoryBot.create(:jira_issue)

  # Test various conditions
  it "is valid with valid attributes" do
    expect(test_issue).to be_valid
  end
  it "is not valid without issue key" do
    test_issue.issue_key = nil
    expect(test_issue).to_not be_valid
  end
  it "is not valid without issue URL" do
    test_issue.issue_url = nil
    expect(test_issue).to_not be_valid
  end
  it "is not valid without issue title" do
    test_issue.issue_title = nil
    expect(test_issue).to_not be_valid
  end
  it "is not valid without issue status" do
    test_issue.issue_status = nil
    expect(test_issue).to_not be_valid
  end
  it "is not valid without issue type" do
    test_issue.issue_type = nil
    expect(test_issue).to_not be_valid
  end
end
