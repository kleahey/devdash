require 'faker'

FactoryGirl.define do
  factory :program do
    name { Faker::Simpsons.location }
    id 1
  end
end
