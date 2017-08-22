require 'faker'

FactoryGirl.define do
  factory :sprint do
    name { Faker::Seinfeld.quote }
    start_date { Faker::Date.between(1.year.ago, 6.months.ago) }
    end_date { Faker::Date.between(6.months.ago, 1.day.ago) }
  end
end
