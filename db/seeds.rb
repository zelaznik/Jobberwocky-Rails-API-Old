# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do
  Product.all.each { |u| u.destroy! }
  User.all.each { |u| u.destroy! }

  make_products = Proc.new do |user|
    8.times do |i|
      product = FactoryGirl.create :product, user: user
    end
  end

  steve = User.create! id: 1, email: 'zelaznik@yahoo.com', password: 'password'
  make_products.call(steve)
  (2...8).each do |i|
    user = FactoryGirl.create :user
    make_products.call(user)
  end

end
