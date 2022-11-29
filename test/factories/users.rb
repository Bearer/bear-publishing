FactoryBot.define do
  factory :user do
    name { "#{Faker::Name.first_name} #{Faker::Name.unique.last_name}" }
    email { Faker::Internet.safe_email(name: name.downcase.gsub(" ",".")) }
    telephone { Faker::PhoneNumber.phone_number_with_country_code }
    organization
  end
end
