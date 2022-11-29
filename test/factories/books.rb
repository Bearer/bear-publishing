FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author
    published_at {Faker::Date.between(from: '2000-01-1', to: Date.today) }
    description { Faker::Marketing.buzzwords }
    pages { Faker::Number.within(range: 100..1000) }
    price { Faker::Number.within(range: 2.0..30.0).round(2) }
  end
end
