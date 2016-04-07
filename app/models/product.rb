class Product < ActiveRecord::Base
  belongs_to :user, inverse_of: :products
  validates :title, :user_id, presence: true
  validates :price, presence: true,
            numericality: { gerater_than_or_equal_to: 0}

  scope :filter_by_title, lambda { |keyword|
    where("lower(title) LIKE ?", "%#{keyword.downcase}%" )
  }

  scope :above_or_equal_to_price, lambda { |price|
    where("price >= ?", price)
  }

  scope :below_or_equal_to_price, lambda { |price|
    where("price <= ?", price)
  }

  scope :recent , -> {
    order(:updated_at)
  }

end
