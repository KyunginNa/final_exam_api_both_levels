FactoryBot.define do
  factory :comment do
    body { "MyText" }
    association :user
    association :article
  end
end
