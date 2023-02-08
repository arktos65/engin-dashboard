#!/bin/zsh
echo "ENGIN SAMPLE DATA LOADER"
rails import:departments examples/import/departments.yml
rails import:sources examples/import/sources.yml
rails import:currencies examples/import/currencies.yml
rails import:roles examples/import/roles.yml
rails import:streams examples/import/streams.yml
rails import:members examples/import/members.yml
rails import:projects examples/import/projects.yml
rails import:resource_rates examples/import/resource_rates.yml
echo "LOADER FINISHED"