#!/usr/bin/env ruby

setup = [
  'cp config/database.example.yml config/database.yml',
  'cp .env.example .env',
  'bundle install',
  'bundle exec rake db:setup',
  'echo "*** review .env and update with correct details ***"'
].join(" && ")

system(setup)
