namespace :deploylist do
  task fetch: :environment do
    FullImport.call(10)
  end
end
