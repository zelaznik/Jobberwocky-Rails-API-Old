# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    title { Faker::Product.product_name }
    price { rand() * 100 }
    published { (rand()*2 <= 1) }
    user { FactoryGirl.create :user }
  end
end
