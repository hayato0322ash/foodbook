FactoryBot.define do
  factory :reply do
    content { 'MyText' }
    user { comment.user }
    association :comment
  end
end
