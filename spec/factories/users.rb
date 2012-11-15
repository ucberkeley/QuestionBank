# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'Test User'
    email 'example@example.com'
    provider "MyString"

    factory :admin do
        after(:create) {|user| user.add_role(:admin)}
    end
  end
end