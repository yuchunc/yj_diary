FactoryGirl.define do
  factory :member do
    # before(:create) { |member| member.skip_confirmation_notification! }
    sequence(:email) { |n| n.to_s + Faker::Internet.email }
    password "passwordtolife"
  end
end
