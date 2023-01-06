# EngIn Dashboard Application

This document provides an overview of the EngIn Dashboard application for managing and reporting
on product development costs by value stream.  You will also find instructions for setting up
development and test environments.

**Requirements:** Ruby ~> v2.7.2, Rails ~> v6.1.7, MySQL Server ~> 8.0, Docker Desktop, Redis

## Development Prerequisites

The following prerequisites should be installed on your workstation before working on the
EngIn app project:

* [Ruby Version Manager](http://www.rvm.io/)
* [MySQL Server CE](https://dev.mysql.com/downloads/)
* MySQL Workbench (optional)
* Docker Desktop (required to run Redis)
* Editor or IDE (suggest RubyMine from JetBrains)
* HomeBrew (for MacOS)

### Setting Up Ruby Environment

These instructions assume you have installed the Ruby Version Manager on your workstation.  To install
Ruby:

    $ rvm install 2.7.2

RVM will install the Ruby interpreter.  It's good practice to use gemsets to keep various projects
separated to reduce the likelihood of Ruby gem version conflicts between your projects.  The following
snippet can be used to create your environment:

    $ rvm use 2.7.2
    $ rvm gemset create engin-dash
    $ rvm use 2.7.2@engin-dash
    $ gem install bundler

You can set your gemset to be the default by using the command:

    $ rvm use 2.7.2@engin-dash --default

### Setting Up Development Project

Once you have your Ruby environment set up, it's time to download the source code and finish setting
things up. From the work directory where you plan to save the source code:

    $ git clone git@github.com:arktos65/engin-dashboard.git
    $ cd engin-dashboard
    $ bundle install
    $ brew install yarn

The previous commands clone a copy of the `engin-dashboard` repository from Github to your local work
directory.  Then you change directory into the source code root directory and run `bundler` to
install all the required Ruby gems for the project.  The `Gemfile` provides the list of gems and
version constraints to be installed.

The application requires a number of shell environment variables to be defined.  You can learn more
about these variables in the [ENVIRONMENT.md](ENVIRONMENT.md) documentation.

### Preparing Bootstrap Template

The next step is to install all of required libraries and dependencies for the Bootstrap template
used in this application:

    $ npm install --global gulp-cli
    $ cd <root_directory>/vendor/assets/sneat-bootstrap
    $ yarn

Read the [SNEAT_TEMPLATE.md](SNEAT_TEMPLATE.md) file for instructions on building and maintain the template within
the project.

### Network local hosts

Edit your /etc/hosts file and add the following line:

    127.0.0.1 engin-db engin-redis.

### Initialize Database Environment

You will need to install MySQL 8 either locally on your development machine or run the containerized version.
MySQL setup instructions are outside the scope of this document. Verify that your `confif/database.yml` file
is setup correctly for your MySQL installation.

In a termainal window, from the root source code directory:

    $ rvm use 2.7.2@engin-dashboard
    $ rails db:create db:migrate
    $ rails db:seed

You should see some messages starting with:

    Task->Seeding database:
      * [OK] Admin User (seed)
      * [OK] Users (seed)
      * [OK] Departments (seed)
      * [OK] Sources (seed)
      * [OK] Value Streams (seed)
      * [OK] Projects (seed)
      * [OK] Roles (seed)
      * [OK] Currencies (seed)
      * [OK] Members (seed)
      * [OK] Teams (seed)
      * [OK] Jira Projects (seed)
      * [OK] Jira Issues (seed)
    
    Default admin user credentials:
    Username: admin@example.com
    Password: password123

This means your database environment has been successfully initialized.

### Manually Loading Jira Data

In your development database, you may manually load or update data from Jira with your database.  From the
project root directory of the engin-dash code base:

    $ rvm use
    $ rails loader:jira_projects
    2022-08-02 - 10:51:50.050:   Connecting to Jira instance
    2022-08-02 - 10:51:50.050:   Fetching all projects from Jira
    2022-08-02 - 10:51:50.635:   Upserting Jira projects to EngIn database

    $ rails loader:jira_issues
    2022-08-02 - 10:53:16.605:   Connecting to Jira instance
    2022-08-02 - 10:53:16.605:   Fetching all projects from Jira

### Clearing Database Tables

If you need to clear database tables, you can do so with some provided rake tasks.  From the project
root directory of the engin-dash code base:

    $ rvm use
    $ rails utility:clear_jira_issues
    2022-08-02 - 10:59:16.126:   Clearing Jira Issues database table
    2022-08-02 - 10:59:16.253:   Task complete
    
    $ rails utility:clear_jira_projects
    2022-08-02 - 10:59:55.695:   Clearing Jira Projects database table
    2022-08-02 - 10:59:55.817:   Task complete

If you're clearing out the Jira data, perform these operations in the order as illustrated above.

### Setting Up Redis Server

This application uses the Sidekiq gem to manage asynchronous background tasks such as automatically syncing the
database with your Jira instance and other reporting jobs that run on a regular schedule.  Sidekiq requires
a Redis server for maintaining state information.  After installing Docker Desktop, from a terminal:

    $ docker pull redis

You should see something similar to below:

    Using default tag: latest
    latest: Pulling from library/redis
    b85a868b505f: Pull complete
    b09642bd3b88: Pull complete
    e0678a951c8d: Pull complete
    d5d7c0a1681b: Pull complete
    954286b64dd1: Pull complete
    58024fcab1ef: Pull complete
    Digest: sha256:d581aded52343c461f32e4a48125879ed2596291f4ea4baa7e3af0ad1e56feed
    Status: Downloaded newer image for redis:latest
    docker.io/library/redis:latest

Start the Redis server by running the `start-redis.sh` script in the root directory of the application.

    ./start-redis.sh

Confirm that Redis is now running by using the command:

    $ docker ps

    CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS                    NAMES
    45a54c905509   redis     "docker-entrypoint.s…"   16 seconds ago   Up 15 seconds   0.0.0.0:6379->6379/tcp   redis

By default, Sidekiq will look for the Redis server on `localhost` at the default port of `6379`.

### Test the Application

The final step is to verify everything works properly.  From the root source code directory:

    $ rails server

You should see:

    => Booting Puma
    => Rails 6.1.6 application starting in development
    => Run `bin/rails server --help` for more startup options
    Puma starting in single mode...
    * Puma version: 5.6.4 (ruby 2.7.2-p137) ("Birdie's Version")
    *  Min threads: 5
    *  Max threads: 5
    *  Environment: development
    *      PID: 38805
    * Listening on http://127.0.0.1:3000
    * Listening on http://[::1]:3000

Now open your web browser and type in `http://localhost:3000/`.  If the application is healthy, you should
see a login page.

You can stop the application by pressing CTRL-C in the terminal window where it is running.

## Local Jira Development & Testing

If you wish to develop and test against a local Jira instance use the following:

- Install Atlassian SDK - https://developer.atlassian.com/server/framework/atlassian-sdk/install-the-atlassian-sdk-on-a-linux-or-mac-system/
- Run standalone Jira with command `$ atlas-run-standalone --product jira`

Once this is running, you should be able to connect to `http://localhost:2990/jira` and login to the JIRA admin system using `admin:admin`.

# License & Authors

- Author:: Sean M. Sullivan (<sean.sullivan@beatport.com>)

```text
Copyright:: 2023 Beatport, LLC.  All rights reserved.

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
```