# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job_application, :class => 'JobApplication' do
    company { FactoryGirl.create :company }
    user { FactoryGirl.create :user }
    job_title "MyString"
    url "MyString"
    first_applied "2016-04-08"
    last_update "2016-04-08"
    status nil
  end
end
