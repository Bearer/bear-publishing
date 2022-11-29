FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author
    published_at {Faker::Date.between(from: '2000-01-1', to: Date.today) }
    description { Faker::Marketing.buzzwords }
    pages { Faker::Number.within(range: 100..1000) }
  end
end
