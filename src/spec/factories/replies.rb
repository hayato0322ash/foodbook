FactoryBot.define do
  factory :reply do
    user_id { 1 }
    comment_id { 1 }
    content { "MyText" }
  end
end
