#!/usr/bin/env ruby

setup = [
  'cp .env.example .env',
  'bundle install -j 4',
  'bundle exec rake db:setup',
  'echo "*** review .env and update with correct details ***"'
].join(" && ")

system(setup)
