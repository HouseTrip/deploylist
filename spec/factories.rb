FactoryGirl.define do
  factory :deploy do
    sequence(:uid)
    sha '10f0393d'
    username 'Jesper'
    environment 'production'
    time { Time.now }
  end

  factory :comment do
    # user # This will fail unless user is passed in
    deploy
    text 'This is a comment'
  end
end
