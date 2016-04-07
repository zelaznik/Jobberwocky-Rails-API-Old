require 'spec_helper'

describe Order do

  let(:p1) { FactoryGirl.create :product, price: 100 }
  let(:p2) { FactoryGirl.create :product, price: 85 }
  let(:order) { FactoryGirl.build :order, product_ids: [p1.id, p2.id] }
  subject { order }

  it { should respond_to :total }
  it { should respond_to :user_id }
  it { should validate_presence_of :user_id }

  it { should belong_to :user }

  it { should have_many(:placements) }
  it { should have_many(:products).through(:placements) }

  describe ".total" do
    it "updates to the correct amount after creation" do
      expect( order.total ).to eql 185
    end
  end

end
