FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password_digest { Faker::String.random(length: 3..12) }
    role { Faker::String.random(length: 3..12) }
  end
end
