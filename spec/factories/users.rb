FactoryBot.define do
  factory :user do
    address { Faker::Blockchain::Ethereum.address }
  end
end
