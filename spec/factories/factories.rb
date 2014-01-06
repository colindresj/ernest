FactoryGirl.define do
  factory :user do
    email "testing@example.com"
    password "testing123"
    password_confirmation "testing123"
  end
end
