$LOAD_PATH << __dir__
puts 'DEBUG: loading lib/jira_server' if Rails.configuration.engin['http_debug']

require 'jira_server/connector'
require 'jira_server/issues'
require 'jira_server/projects'
