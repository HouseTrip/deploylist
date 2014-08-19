guard :bundler do
  watch('Gemfile')
end

# guard 'rails' do
#   watch('Gemfile.lock')
#   watch(%r{^(config|lib)/.*})
# end

guard :rspec, cmd: 'bundle exec rspec', all_on_start: true, run_all_after_pass: true do
  watch(%r{^spec/.+_spec\.rb$})
  # watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  # watch('spec/spec_helper.rb')  { "spec" }

  # # Rails example
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  # watch(%r{^app/(.*)(\.erb|\.haml|\.slim)$})          { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  # watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
  # watch(%r{^spec/(support|fixtures)/.*$})             { "spec" }
  # watch('config/routes.rb')                           { "spec/routing" }
  # watch('app/controllers/application_controller.rb')  { "spec/controllers" }
  watch(/.*/) { 'spec' }
end


