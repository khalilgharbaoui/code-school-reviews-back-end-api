FactoryGirl.define do
  factory :codeschool do
    name "CodeschoolName"
    description "Codeschool description very nice yeah"
    logo File.open(File.join(Rails.root, '/spec/fixtures/files/image.png'))
    url "http://google.com"
  end
end
