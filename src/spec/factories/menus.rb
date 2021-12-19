FactoryBot.define do
  factory :menu do
    name { '河上自家焙煎ホットコーヒー' }
    price { 300 }
    evaluation { 5 }
    association :shop
  end
end
