# frozen_string_literal: true
require 'jira-ruby'

# Module: JiraServer::Users
# ETL processor that extracts user account data from a Jira API, transforms the
# data and stores in local database.
module JiraServer
  # This class provides ETL processing of Project resources from a Jira organization.
  class Users
    # This method queries the Jira API for all available users and upserts the
    # project information into the EngIn database.
    def self.update_all
      puts 'DEBUG: executing JiraServer::Users.update_all' if Rails.configuration.engin['http_debug']
      puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Connecting to Jira instance"
      client = JIRA::Client.new(Connector.get_options)

      puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Fetching all users from Jira"
      begin
        users = client.User.all
      rescue StandardError => e
        puts "#{Time.now.strftime('%F - %H:%M:%S.%L')}:   ERROR: An error occurred fetching Jira users"
        puts e.message
        return
      end

      # Iterate through projects and upsert each record to database
      puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Upserting Jira users to EngIn database"
      i = 0
      while i < users.count
        puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   User->#{users[i].accountId}"
        upsert_user(users[i])
        i += 1
      end
    end

    private

    # This method upserts a single Jira user into the jira_users database
    # table.
    def self.upsert_user(the_user)
      user = JiraUser.find_by(account_id: the_user.accountId)
      unless user.nil?
        # Record exists, so update it
        user.update(
          display_name: the_user.displayName,
          is_active: the_user.active,
          self_url: the_user.self
        )
      else
        # Record doesn't exist, so create a new one
        user = JiraUser.create!(
          account_id: the_user.accountId,
          display_name: the_user.displayName,
          is_active: the_user.active,
          self_url: the_user.self
        )
        user.save
      end
    end
  end
end
