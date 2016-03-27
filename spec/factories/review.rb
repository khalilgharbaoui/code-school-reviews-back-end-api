FactoryGirl.define do
  factory :review do

    name Faker::Name.name
    description Faker::Hipster.sentence
    rating Faker::Number.between(0, 5)
    codeschool_id :codeschool
  end
end
