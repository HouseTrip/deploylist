#!/usr/bin/env ruby

setup = [
  'cp config/database.example.yml config/database.yml',
  'bundle install',
  'rake db:setup',
  'rake deploylist:fetch'
].join(" && ")

system(setup)
