# Importing Data into the EngIn Application

This document describes the tools provided to enable you to bulk load database tables particularly for the
first time use in a production environment.  Because of the dependencies between database tables, there is
a recommended order of operations to load the data.  This process respects model validators and database
constraints.

The rake utility reads YAML files that are formatted appropriately to the related database table and inserts
the records into the database through the Active Record API, which ensures that business rules within the
EngIn application's models are enforced.

## Setting up Import Files

Within the code base directory, example YAML files have been provided for each database table that can be
imported to.  You will find the example files in:

    <project_root_dir>/examples/import

The import tool supports single table files with multiple documents.  Each document to be imported is
separated by `---` on a single line indicating to the YML parser that a new record is beginning.

***Do not change the field names as these are the fields recognized by the import tool.  Changing the
format will likely cause import errors.***

## Development Database Seeding

When developing on this project, you can use the seeder tool to add sample data for testing purposes.
To see your development database you can use the following command:

    $ rails db:seed

If you wish to reset your database and reseed it using the following command:

    $ rails db:reset

These commands must be executed from the root directory of the project.

## First Time Use

Preparing the EngIn application for first time use, you can create YAML files based on the provided examples
to create the initial data to be loaded.  This approach is useful if you wish to reset the database back to
a pristine state, or creating a test/stage environment with production data.

1. Copy the example files to another directory outside of the project directory to ensure your production data
   isn't accidentally added to the Git project and published on the internet.
2. Edit each of the copied example files and populate the file with the data you wish to import.  Pay close
   attention to any field that ends with `_id` as these are foreign key values that link the record to records
   in other database tables.

The example files have been tested and can be used to test the import tool to see the results in the database.

The import command, which needs to be run from the project root directory, is as follows:

    $ rails import:<table> <yaml_file>

The table names follow the database table naming convention to make it easier to remember.

### Order of Operations

The following list is the recommended order to import the data so you don't run into referential integrity
errors during the import process:

- `$ rails import:admins <yaml_file>` -- Creates admin level users in the application.
- `$ rails import:users <yaml_file>` -- Creates general users in the application.  Be sure to include department
  managers in this file because departments are owned by management users.
- `$ rails import:departments <yaml_file>` -- Loads departments you wish to track and assigns them to a manager
  from the `users` table.
- `$ rails import:sources <yaml_file>` -- Loads sources, which are business entities from where employees and contractors
  are sourced.
- `$ rails import:currencies <yaml_file>` -- Loads the supported currencies employees and contractors are paid in.
- `$ rails import:streams <yaml_file>` -- Loads the business Value Streams into the database.
- `$ rails import:projects <yaml_file>` -- Loads projects under Value Streams into the database.
- `$ rails import:roles <yaml_file>` -- Loads the job roles by department into the database.
- `$ rails import:members <yaml_file>` -- Loads the employees and contractors in your organization into the database.
- `$ rails import:resource_budgets <yaml_file>` -- Loads the initial staffing budget for each member in the organization.
- `$ rails import:teams <yaml_file>` -- Loads the team assignments for each member in the organization.  Teams
  belong to projects.

After successfully importing all the various data tables, your application should be ready to use.

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