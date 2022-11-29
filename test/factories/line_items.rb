FactoryBot.define do
  factory :line_item do
    order { nil }
    book { nil }
    quantity { 1 }
  end
end
