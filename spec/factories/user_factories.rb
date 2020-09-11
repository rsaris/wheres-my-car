FactoryBot.define do
  factory :user do
    email
    provider { 'google' }
    uid
  end
end
