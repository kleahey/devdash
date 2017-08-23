require 'faker'

FactoryGirl.define do
  factory :task do
    historical_date { Faker::Date.between(75.days.ago, Time.zone.yesterday) }
    task_hours { Faker::Number.decimal(1) }
  end
end
