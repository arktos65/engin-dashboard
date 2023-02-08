# Managing Jira Data within the EngIn Application

The EngIn application provides a number of tools for loading and managing data that is imported and processed
from the Jira API.  Most of the loader tools are scheduled and managed by Sidekiq in the production environment but
can also be used from the command line for a development environment.

The command line tools should be used from the root directory of the project.  It is assumed you followed the
set up instructions in the [README](README.md) so you will have the proper Ruby environment with all the prerequisite
gems installed.

## Before Starting

From the root directory of the `engin-dashboard` project be sure to use the following command:

    $ rvm use

This will ensure you're using the correct Ruby version and gemset.

## Loading Jira Projects

In Jira, projects are a means of organizing issues (stories, tasks, and bugs).

    $ rails loader:jira_projects
    2022-08-02 - 10:51:50.050:   Connecting to Jira instance
    2022-08-02 - 10:51:50.050:   Fetching all projects from Jira
    2022-08-02 - 10:51:50.635:   Upserting Jira projects to EngIn database

The tool uses an upsert methodology for managing Jira project records.  If the project doesn't exist in the database
table, a new project record is created.  If it does exist, it is updated with the latest changes from the Jira API.

## Loading Jira Issues

Issues within Jira are a collection of tickets that include user stories, tasks, epics and bugs.

    $ rails loader:jira_issues
    2022-08-02 - 10:53:16.605:   Connecting to Jira instance
    2022-08-02 - 10:53:16.605:   Fetching all projects from Jira

As with projects, the tool uses an upsert methodology for managing issues.  If the issue doesn't exist in the database
table, a new issue record is created.  If it does exist, it is updated with the latest changes from the Jira API.

## Resetting the Jira Tables

If at any time you want to reset the Jira database tables use the following commands respectively:

    $ rails utility:clear_jira_issues
    2022-08-02 - 10:59:16.126:   Clearing Jira Issues database table
    2022-08-02 - 10:59:16.253:   Task complete
    
    $ rails utility:clear_jira_projects
    2022-08-02 - 10:59:55.695:   Clearing Jira Projects database table
    2022-08-02 - 10:59:55.817:   Task complete

**NOTE:** Generally, these commands should not be used in the production environment unless the administrator 
is working on the system.  These commands are primarily used by developers for resetting their local dev environment.





