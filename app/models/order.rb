class Order < ActiveRecord::Base
  validates :user_id, presence: true
  before_save :set_total!

  belongs_to :user
  has_many :placements, dependent: :destroy
  has_many :products, through: :placements

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
