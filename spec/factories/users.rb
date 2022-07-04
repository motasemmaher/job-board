FactoryBot.define do
  factory :user do
    name { Faker::TvShows::Friends.character }
    email { Faker::Internet.email }
    phone_number { Faker::PhoneNumber.phone_number }
    password_digest { Faker::String.random(length: 3..12) }
    role { Faker::String.random(length: 3..12) }
  end
end
