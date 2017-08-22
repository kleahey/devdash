require 'faker'

FactoryGirl.define do
  factory :project do
    assigned_id { Faker::Number.number(8) }
    name { Faker::Seinfeld.quote }
  end
end
