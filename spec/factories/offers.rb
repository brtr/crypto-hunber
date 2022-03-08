FactoryBot.define do
  factory :offer do
    name { Faker::Lorem.word }
    desc { Faker::Lorem.paragraph }
    status { "avaliable" }
    count { 10 }
    reward { 10 }
  end
end
