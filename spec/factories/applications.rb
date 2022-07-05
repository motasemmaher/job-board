FactoryBot.define do
  factory :application do
    id { Faker::Number.within(range: 100..10_000) }
    status { %i[seen not_seen].sample }

    association :user, factory: :user
    association :job, factory: :job
  end
end
