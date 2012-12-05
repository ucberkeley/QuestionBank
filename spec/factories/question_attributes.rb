# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question_attribute, :class => 'QuestionAttributes' do
    name "MyString"
    backend_type "MyString"
  end
end
