FactoryGirl.define do
  sequence :user_number do |number|
    number
  end

  factory :user do
    email { "user#{generate(:user_number)}@example.com" }
    password 'password'
  end
end