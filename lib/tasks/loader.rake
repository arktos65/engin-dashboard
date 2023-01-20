require 'jira_server'

namespace :loader do
  include JiraServer
  desc "Update Jira database tables from the JIRA API"

  task jira_projects: :environment do
    puts 'DEBUG: executing loader:jira_projects task' if Rails.configuration.engin['http_debug']
    JiraServer::Projects.update_all
  end

  task jira_issues: :environment do
    puts 'DEBUG: executing loader:jira_issues task' if Rails.configuration.engin['http_debug']
    JiraServer::Issues.update_all
  end

  task jira_users: :environment do
    puts 'DEBUG: executing loader:jira_users task' if Rails.configuration.engin['http_debug']
    JiraServer::Users.update_all
  end

  # task jira_statistics: :environment do
  #   puts 'DEBUG: executing loader:jira_statistics task' if Rails.configuration.engin['http_debug']
  #   include ProjectReporting
  #   process_jira_issues
  # end

  task test_connector: :environment do
    puts 'DEBUG: executing loader:test_connector task' if Rails.configuration.engin['http_debug']
    JiraServer::Connector.test_connector
  end

  task help: :environment do
    puts "Available actions for loader tasks:"
    puts "- `$ rails loader:help` -- Displays this help text."
    puts "- '$ rails loader:test_connector' -- Tests Jira Server connection."
    puts "- `$ rails loader:jira_projects` -- Performs an upsert of Jira projects to EngIn database."
    puts "- `$ rails loader:jira_issues` -- Performs an upsert of Jira issues to EngIn database."
    puts "- `$ rails loader:jira_statistics` -- Process weekly Jira data and generate statistics for reporting."
    puts "- `$ rails loader:jira_users` -- Performs an upsert of Jira users to EngIn database."
  end
end