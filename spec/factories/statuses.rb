# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :status, :class => 'Status' do
    label "MyText"
  end
end
