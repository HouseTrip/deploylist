namespace :deploylist do
  task fetch: :environment do
    DeployFetcher.new.run
  end
end
