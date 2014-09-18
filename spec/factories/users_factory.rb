FactoryGirl.define do
  factory :user do
  	sequence(:email) { |n|"me#{n}@me.com" }
  	name 'brian'
    sequence(:username) { |n| "brianllamar#{n}"}
    password 'top_secret'
    password_confirmation 'top_secret'
  end

  factory :fake_user do
    email Faker::Internet.email
    name Faker::Name.name
    username Faker::Internet.user_name
    password 'top_secret'
    password_confirmation 'top_secret'

    factory :confirmed_user, :parent => :user do
      after(:create) { |user| user.confirm! }
    end
  end

end
