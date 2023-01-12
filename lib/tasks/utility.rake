namespace :utility do
  desc "EngIn application utilities"

  task clear_jira_issues: :environment do
    include EnginUtility
    destroy_jira_issues
  end

  task clear_jira_projects: :environment do
    include EnginUtility
    destroy_jira_projects
  end

  # task clear_statistics: :environment do
  #   include EnginUtility
  #   destroy_statistics
  # end

  task help: :environment do
    puts "Available actions for utility tasks:"
    puts "- `$ rails utility:help` -- Displays this help text."
    puts "- `$ rails utility:clear_jira_issues` -- Destructive action! Destroys all Jira issues tracked in EngIn."
    puts "- `$ rails utility:clear_jira_projects` -- Destructive action! Destroys all Jira projects tracked in EngIn."
    puts "- `$ rails utility:clear_statistics` -- Destructive action! Destroys all project statistics tracked in EngIn."
  end
end
