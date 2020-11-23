FactoryBot.define do
  factory :post do
    image       { 'ODD8F592-3Of9-4E76-9BBT73BE481DO95B.jpeg' }
    name        { Faker::Name.name }
    url         { Faker::Internet.url }
    impressions { Faker::Lorem.sentence }
    association :user
  end
end
