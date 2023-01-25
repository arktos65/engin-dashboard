require 'rails_helper'

RSpec.describe ProjectStatistic, type: :model do
  # Create data object to be tested
  test_project = FactoryBot.create(:project_statistic)

  # Test the various conditions
  it 'is valid with valid attributes' do
    expect(test_project).to be_valid
  end
  it 'is not valid without a project' do
    test_project.project_id = nil
    expect(test_project).to_not be_valid
  end
  it 'is not valid without a stream id' do
    test_project.stream_id = nil
    expect(test_project).to_not be_valid
  end
  it 'is not valid without a stream name' do
    test_project.stream_name = nil
    expect(test_project).to_not be_valid
  end
end
