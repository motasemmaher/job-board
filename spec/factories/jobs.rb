FactoryBot.define do
  factory :job do
    title { Faker::TvShows::Friends.character }
    description { Faker::TvShows::Friends.quote }
  end
end
