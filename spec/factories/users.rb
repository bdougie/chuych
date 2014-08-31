# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	email 'me@me.com'
  	name 'brian'
    username 'brianllaamr'
    password 'monkeyturtles'
    password_confirmation 'monkeyturtles'
  end
end
