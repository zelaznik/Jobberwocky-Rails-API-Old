class Order < ActiveRecord::Base
  belongs_to :user
  has_many :placements, dependent: :destroy
  has_many :products, through: :placements

  validates :user_id, presence: true
  validates_with EnoughProductsValidator
  before_save :set_total!

  def total
    set_total!
  end

  def set_total!
    self.total = products.map(&:price).sum
  end

  def build_placements_with_product_ids_and_quantities(product_ids_and_quantities)
    product_ids_and_quantities.each do |id, quantity|
      self.placements.build product_id: id, quantity: quantity
    end
  end

end
