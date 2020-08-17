# PokemonBackup

PokemonBackup is an app that allows you to create, purge and search a backup of the Pokemon TCG API.

This project has the following dependencies:

* Ruby 2.7.1
* Rails 6.0.3
* Postgres 12.3

Once you have those dependencies installed, follow these steps to run it locally:

* Clone this project.
* Navigate to your copy of the project in the command line.
* Run `bundle install`
* Run `rails db:create db:migrate`
* Run `rails s`
* Navigate to http://localhost:3000 on your browser.

This project was developed under the following assumptions:

* The "Purge Backup" and "Search Backup" options must only appear after you create a backup.
* Creating a new backup automatically purges the last successfully processed backup.
* Search does consider partial matches, but upper/lowercases must be an exact match.
