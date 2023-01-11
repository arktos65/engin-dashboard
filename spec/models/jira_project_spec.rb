require 'rails_helper'

RSpec.describe JiraProject, type: :model do
  # Create the data object for testing
  test_project = FactoryBot.create(:jira_project)

  # Test various conditions
  it "is valid with valid attributes" do
    expect(test_project).to be_valid
  end
  it "is not valid when missing project name" do
    test_project.name = nil
    expect(test_project).to_not be_valid
  end
  it "is not valid when missing the Jira key" do
    test_project.jira_key = nil
    expect(test_project).to_not be_valid
  end
  it "is not valid when missing the self URL" do
    test_project.self_url = nil
    expect(test_project).to_not be_valid
  end
end
