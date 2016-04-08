# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company, :class => 'Company' do
    name "MyString"
    url "MyString"
  end
end
