namespace :deploylist do
  task fetch: :environment do
    FullImport.call
  end
end
