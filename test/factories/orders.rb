FactoryBot.define do
  factory :order do
    organization
    user
    status { 1 }
  end
end
