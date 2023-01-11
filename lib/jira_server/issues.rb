# frozen_string_literal: true
require 'jira-ruby'

# Module: JiraServer::Issues
# ETL processor that extracts project issues data from a Jira API, transforms the
# data and stores in local database.
module JiraServer
  class Issues
    # Update project issues by iterating through each project registered
    # in Jira and upserting to the jira_issues table.
    def self.update_all
      puts 'DEBUG: executing JiraServer::Issues.update_all' if Rails.configuration.engin['http_debug']
      max_results = Rails.configuration.jira['max_results']
      puts "#{Time.now.strftime('%F - %H:%M:%S.%L')}:   Connecting to Jira instance"
      client = JIRA::Client.new(Connector.get_options)

      puts "#{Time.now.strftime('%F - %H:%M:%S.%L')}:   Fetching all projects from Jira"
      begin
        jira_projects = client.Project.all
      rescue StandardError => e
        puts "#{Time.now.strftime('%F - %H:%M:%S.%L')}:   ERROR: An error occurred while fetching Jira projects"
        puts e.message
        return
      end

      # Iterate through projects and upsert each record to database
      i = 0
      while i < jira_projects.count
        page = 0
        item_count = 0
        is_last = false
        puts "#{Time.now.strftime('%F - %H:%M:%S.%L')}:   Fetching issues for project #{jira_projects[i].name}"
        puts "#{Time.now.strftime('%F - %H:%M:%S.%L')}:   Upserting Jira issues to EngIn database"
        until is_last
          error_status = false
          begin
            issues = jira_projects[i].issues(startAt: page * max_results, maxResults: max_results)
          rescue StandardError => e
            puts "#{Time.now.strftime('%F - %H:%M:%S.%L')}:   ERROR: An error occurred while fetching Jira issues"
            puts e.message
            error_status = true
          end
          if issues.count > 0 && !error_status
            jira_project_rec = get_jira_project(jira_projects[i].id)
            upsert_issues(issues, jira_project_rec.id)
            item_count = item_count + issues.count
            page += 1
          else
            is_last = true
          end
        end
        puts "#{Time.now.strftime('%F - %H:%M:%S.%L')}:   Processed #{item_count} issues for project #{jira_projects[i].name}"
        i += 1
      end
    end

    private

    # Locate Jira project record in application database
    def self.get_jira_project(jira_id)
      JiraProject.find_by(jira_project_id: jira_id)
    end

    # This method upserts a single Jira project issue into the jira_issues
    # database table.
    def self.upsert_issues(issues, project_id)
      i = 0
      while i < issues.count
        issue = JiraIssue.find_by(jira_issue_id: issues[i].id)
        if issue.nil?
          # Record does not exist, so create it
          issue = JiraIssue.create!(
            jira_issue_id: issues[i].id,
            jira_project_id: project_id,
            issue_key: issues[i].key,
            issue_url: issues[i].self,
            issue_title: issues[i].summary,
            issue_status: issues[i].status.name,
            issue_type: issues[i].issuetype.name,
            story_points: 1,
            issue_created: issues[i].created,
            issue_updated: issues[i].updated)
          issue.save
        else
          # Record exists, so update it
          issue.update(
            issue_key: issues[i].key,
            issue_url: issues[i].self,
            issue_title: issues[i].summary,
            issue_status: issues[i].status.name,
            issue_type: issues[i].issuetype.name,
            story_points: issues[i].customfield_10103,
            issue_created: issues[i].created,
            issue_updated: issues[i].updated)
        end
        i += 1
      end
    end
  end
end