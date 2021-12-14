FactoryBot.define do
  factory :reply do
    content { 'MyText' }
    association :user
    association :menu
    association :comment
  end
end
