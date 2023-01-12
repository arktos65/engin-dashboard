# frozen_string_literal: true

# Module: EnginUtility
# This module provides tools for performing certain administration duties within the
# application from the Rails Console.
module EnginUtility
  # This method clears and resets the Jira Issues and Jira Projects table.
  def destroy_all_jira_data
    puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Begin clearing Jira database tables"
    destroy_jira_issues
    destroy_jira_projects
  end

  # This method clears and resets the Jira Projects table.
  def destroy_jira_projects
    puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Clearing Jira Projects database table"
    begin
      JiraProject.destroy_all
    rescue StandardError => e
      puts "#{Time.now.strftime('%F - %H:%M:%S.%L')}:   ERROR: An error occurred clearing table"
      puts e.message
      return
    end
    puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Task complete"
  end

  # This method clears and resets the Jira Issues table.
  def destroy_jira_issues
    puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Clearing Jira Issues database table"
    begin
      JiraIssue.destroy_all
    rescue StandardError => e
      puts "#{Time.now.strftime('%F - %H:%M:%S.%L')}:   ERROR: An error occurred clearing table"
      puts e.message
      return
    end
    puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Task complete"
  end

  # This method clears the Project Statistics table.
  # def destroy_statistics
  #   puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Clearing Project Statistics database table"
  #   begin
  #     ProjectStatistic.destroy_all
  #   rescue StandardError => e
  #     puts "#{Time.now.strftime('%F - %H:%M:%S.%L')}:   ERROR: An error occurred clearing table"
  #     puts e.message
  #     return
  #   end
  #   puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Task complete"
  # end
end
