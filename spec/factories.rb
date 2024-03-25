FactoryBot.define do
  factory(:project) do
    name { Faker::TvShows::TheITCrowd.quote }
    description { Faker::TvShows::MichaelScott.quote }
    priority { Faker::Number.between(from: 1.0, to: 4.0).round(1) }
  end
end
