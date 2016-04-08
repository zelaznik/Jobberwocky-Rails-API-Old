# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    title { Faker::Product.product_name }
    price { rand() * 100 }
    published false
    user
    quantity 5
  end
end
