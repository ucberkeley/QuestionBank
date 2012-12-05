# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question_value, :class => 'QuestionValues' do
    string_value "MyString"
    float_value 1.5
    text_value "MyText"
    integer_value 1
    bool_value false
    date_value "2012-12-04 21:14:57"
  end
end
