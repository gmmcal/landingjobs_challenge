FactoryGirl.define do
  factory :company do
    name { Faker::Company.name }
    short_pitch { Faker::Company.catch_phrase }
    description { Faker::Lorem.paragraph }
    logo_url { Faker::Company.logo }
    website_url { Faker::Internet.url }
  end
end
