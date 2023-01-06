# Notes Regarding Environment Variables

A number of the application's features are configured through environment variables.  This technique
provides greater security for sensitive information such as database user/password and so forth.
This document describes each of the available environment variables and how the application uses them.

## Environment Variables

The available environment variables are thus:

| Variable Name        | Example Value                 | Description                                             |
|----------------------|-------------------------------|---------------------------------------------------------|
| JIRA_SITE            | https://company.atlassian.net | URL of the Jira server instance you want to connect to. |
| JIRA_CONTEXT         | /                             | Typically this will be the value you should use.        |
| JIRA_USER            | jane@company.com              | The Jira user that the API key is assigned to.          |
| JIRA_API_KEY         | alphanumeric string           | Access key generated from Jira.                         |
| PRODUCTBOARD_API_KEY | alphanumeric string           | JWT encoded API key for accessing ProductBoard API.     |
| PRODUCTBOARD_API_URL | https://api.productboard.com/ | URL of ProductBoard API.                                |
| ENGIN_REDIS_SERVER   | localhost                     | Host name of the Redis server instance for EnginApp.    |
| ENGIN_REDIS_PORT     | 6379                          | TCP port number of Redis data store on server.          |
| MYSQL_DB_USER        | dbuser                        | MySQL database user name for application.               |
| MYSQL_DB_PASS        | password string               | MySQL database user password.                           |

## Development Environment

For your development environment, these variables can be added to one of your shell preference files (depending
on the shell you prefer).  For example, on MacOS, the default shell is ZSH.  You would edit the `.zshrc` file in your
home directory and add these environment variables like such:

    export JIRA_SITE="https://company.atlassian.net"

## Docker Containers

This application is designed to run in stage and production environments as a Docker container.  You may use the
`docker-compose.yml` file in the source repository as a reference to implement your own Docker image build and
deployment package.