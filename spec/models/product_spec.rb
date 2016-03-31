require 'spec_helper'

describe Product do
  let(:product) { FactoryGirl.build :product }
  subject { product }
  it { should respond_to(:title) }
  it { should respond_to(:price) }
  it { should respond_to(:published) }
  it { should respond_to(:user_id) }

  it "should not be published" do
    expect(!!product.published).to eql false
  end
end
