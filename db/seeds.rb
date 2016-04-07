# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do
  [Placement,Order,Product,User].each do |model|
    model.all.each {|record| record.destroy! }
  end

  steve = User.create! id: 1, email: 'zelaznik@yahoo.com', password: 'password'
  25.times { product = FactoryGirl.create :product, user: steve }

  (2...8).each do |i|
    user = FactoryGirl.create :user, id: i
    6.times { product = FactoryGirl.create :product, user: user }
  end

end
