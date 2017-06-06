FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    #sequence(:name)  { |n| "user_name#{n}" }
    password '123123123'
    password_confirmation '123123123'
    #sequence(:auth_token)  { |n| "token#{n}" }
  end
end
