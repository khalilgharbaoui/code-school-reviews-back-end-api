FactoryGirl.define do
  factory :codeschool do
    name Faker::Name.name
    description Faker::Hipster.sentence
    logo Faker::Avatar.image
    url Faker::Internet.url
    average_rating Faker::Number.between(0, 5)

    factory :invalid_codeschool do
      name nil
      description nil
      logo nil
      url nil
      average_rating nil
    end

    factory :codeschool_with_reviews do
      after(:create) do |codeschool|
        create_list(:review, 4, codeschool: codeschool)
      end
    end
  end
end
