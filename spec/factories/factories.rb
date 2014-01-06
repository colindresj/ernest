FactoryGirl.define do
  factory :user do
    email "testing@example.com"
    password "testing123"
    password_confirmation "testing123"
  end

  factory :document do
    title "Lorem Ipsum"
    content "Nullam quis risus eget urna mollis ornare vel eu leo."
  end

  factory :editable do
    title "Lorem Ipsum"
    content "Nullam quis risus eget urna mollis ornare vel eu leo."
  end
end
