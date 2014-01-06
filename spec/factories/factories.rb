FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "testing#{n}@test.com" }
    password "testing123"
    password_confirmation "testing123"
    before(:create) do |user|
      invite = BetaInvite.create(email: user.email)
      invite.grantaccess.save!
    end
  end

  factory :document do
    title "Lorem Ipsum"
    content "Nullam quis risus eget urna mollis ornare vel eu leo."
    user
  end

  factory :editable do
    title "Lorem Ipsum"
    content "Nullam quis risus eget urna mollis ornare vel eu leo."
    user
    document
  end

  factory :beta_invite do
    sequence(:email) { |n| "testing#{n}@test.com" }
  end
end
