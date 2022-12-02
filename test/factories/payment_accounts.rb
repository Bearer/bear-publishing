FactoryBot.define do
  factory :payment_account do
    organization { nil }
    reference_name { "MyString" }
    holder_address { "MyText" }
    bank_address { "MyText" }
    bank_name { "MyText" }
    account_number { "MyString" }
    sort_code { "MyString" }
    holder_name { "MyString" }
  end
end
