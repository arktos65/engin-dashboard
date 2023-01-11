require 'rails_helper'

RSpec.describe Project, type: :model do
  # Create data object to be tested
  test_project = FactoryBot.create(:project)

  # Test the various conditions
  it "is valid with valid attributes" do
    expect(test_project).to be_valid
  end
  it "is invalid without a project name" do
    test_project.name = nil
    expect(test_project).to_not be_valid
  end
end
