FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.sentence }
    public_content { Faker::Lorem.paragraphs(rand(2..8)).join('\n') }
    member
    sequence(:created_at) { |n| Time.now.days_ago(n) }
    bu_result { Post.bu_gua.join ',' }
  end
end
