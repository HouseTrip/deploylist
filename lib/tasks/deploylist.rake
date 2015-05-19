namespace :deploylist do

  desc "Perform a full deploy list import"
  task fetch: :environment do
    FullImport.call
  end
end
