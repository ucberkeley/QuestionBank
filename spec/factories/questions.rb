# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    xml "MyText"
    created_at "2012-10-28 03:50:01"
  end
end
