FactoryBot.define do
  factory :comment do
    user
    recommend_project
    content { Faker::Lorem.paragraph }
  end
end
