FactoryGirl.define do
  factory :deploy do
    sequence(:uid)
    sha '10f0393d'
    username 'Jesper'
    environment 'production'
    time { Time.now }
  end
end
