# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
unless Organization.any?
  10.times do
    organization = FactoryBot.create(:organization)
    Faker::Number.within(range: 2..10).times do
      FactoryBot.create(:user, organization:)
    end
  end
end

unless Book.any?
  20.times do
    author = FactoryBot.create(:author)
    Faker::Number.within(range: 1..10).times do
      FactoryBot.create(:book, author:)
    end
  end
end