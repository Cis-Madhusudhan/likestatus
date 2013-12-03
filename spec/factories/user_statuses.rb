# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_status do
    status "MyString"
    user nil
  end
end
