FactoryBot.define do
  factory :user do
    name { 'テストくん' }
    sequence(:email) { 'test@gmail.com' }
    password { 'h03220322' }
    password_confirmation { 'h03220322' }
    sex { '男性' }
    birthday { Date.new(1900, 5, 1) }
  end
end
