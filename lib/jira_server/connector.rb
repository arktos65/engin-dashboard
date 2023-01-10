# frozen_string_literal: true
require 'jira-ruby'

# Module: JiraServer::Connector
# Provides the connector options for the JIRA module that provides the
# methods for interacting with a JIRA API.
module JiraServer
  class Connector
    # This method returns the configured options for the JIRA::Client
    # object used to interact with the JIRA API.
    def self.get_options
      puts 'DEBUG: executing JiraServer::Connector.get_options' if Rails.configuration.engin['http_debug']
      # Using an API token associated with a Jira user account
      connector = {
        username: Rails.configuration.jira['user'],
        password: Rails.configuration.jira['api_key'],
        site: Rails.configuration.jira['site'],
        context_path: Rails.configuration.jira['context'],
        auth_type: :basic,
        read_timeout: Rails.configuration.jira['timeout']
      }
      puts "DEBUG: options => #{connector}" if Rails.configuration.engin['http_debug']
      return connector
    end
  end
end