FactoryGirl.define do
  factory :deploy do
    uid 2
    sha '10f0393d'
    username 'Jesper'
    environment 'production'
    time Time.now
  end
end
