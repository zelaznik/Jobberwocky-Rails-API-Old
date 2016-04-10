require 'spec_helper'

describe Order do
  let(:p1) { FactoryGirl.create :product, price: 100 }
  let(:p2) { FactoryGirl.create :product, price: 85 }
  let(:order) { FactoryGirl.create :order, product_ids: [p1.id, p2.id] }
  subject { order }

  it { should respond_to :total }
  it { should respond_to :user_id }
  it { should validate_presence_of :user_id }

  it { should belong_to :user }

  it { should have_many(:placements).dependent(:destroy) }
  it { should have_many(:products).through(:placements) }

  describe ".total" do
    it "updates to the correct amount after creation" do
      expect( order.total ).to eql 185
    end
  end

  describe "#build_placements_with_product_ids_and_quantities" do
    before(:each) do
      p1 = FactoryGirl.create :product, price: 100, quantity: 5
      p2 = FactoryGirl.create :product, price: 85, quantity: 10
      @ids_and_quantities = [[p1.id, 2], [p2.id, 3]]
    end

    it "builds 2 placements for the order" do
      expect do
        order.build_placements_with_product_ids_and_quantities(@ids_and_quantities)
      end.to change { order.placements.size }.from(2).to(4)
    end
  end

  describe "#valid?" do
    before do
      product_1 = FactoryGirl.create :product, price: 100, quantity: 5
      product_2 = FactoryGirl.create :product, price: 85, quantity: 10

      placement_1 = FactoryGirl.build :placement, product: product_1, quantity: 3
      placement_2 = FactoryGirl.build :placement, product: product_2, quantity: 15

      @order = FactoryGirl.build :order
      @order.placements << placement_1
      @order.placements << placement_2
    end

    it "becomes invalid tue to insufficient products" do
      expect(@order).to_not be_valid
    end
  end

end
