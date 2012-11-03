# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attempt do
    answer "MyText"
    is_correct false
    created_at "2012-11-03 12:11:37"
    question nil
    user nil
  end
end
