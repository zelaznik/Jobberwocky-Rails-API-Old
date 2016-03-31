class Product < ActiveRecord::Base
  belongs_to :user, inverse_of: :products
  validates :title, :user_id, presence: true
  validates :price, presence: true,
            numericality: { gerater_than_or_equal_to: 0}
end
