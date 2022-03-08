FactoryBot.define do
  factory :recommend_project do
    user
    name { Faker::Lorem.word }
    desc { Faker::Lorem.paragraph }
    status { "approved" }
  end
end
