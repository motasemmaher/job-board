FactoryBot.define do
  factory :application do
    user_id { Faker::Number.rand(100) }
    job_id { Faker::Number.rand(100) }
  end
end
