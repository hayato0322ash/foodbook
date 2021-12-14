FactoryBot.define do
  factory :comment do
    content { 'これはテストコードです' }
    association :user
    association :menu
  end
end
