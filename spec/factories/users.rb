FactoryGirl.define do
  sequence(:email) {|n| "user-email-#{n}@mail.com"}

  factory :user do
    email
    password "passwd"
  end
end