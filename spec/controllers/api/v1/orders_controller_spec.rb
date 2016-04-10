require 'spec_helper'

describe Api::V1::OrdersController do
  describe "POST #create" do
    before(:each) do
      current_user = FactoryGirl.create :user
      api_authorization_header current_user.auth_token

      p1 = FactoryGirl.create :product
      p2 = FactoryGirl.create :product
      order_params = { product_ids: [p1.id, p2.id] }
      post :create, user_id: current_user.id, order: order_params
    end

    it "returns just the user order record" do
      order_response = json_response[:order]
      expect(order_response[:id]).to be_present
    end

    it "embeds the two product objects related to the order" do
      order_response = json_response[:order]
      expect(order_response[:products].size).to eql 2
    end

    it { should respond_with 201 }
  end

  describe "GET #show" do
    before(:each) do
      current_user = FactoryGirl.create :user
      api_authorization_header current_user.auth_token
      p3 = FactoryGirl.create :product
      @order = FactoryGirl.create :order, user: current_user, product_ids: [p3.id]
      get :show, user_id: current_user.id, id: @order.id
    end

    it "returns the user order record matching the id" do
      order_response = json_response[:order]
      expect(order_response[:id]).to eql @order.id
    end

    it "includes the total for the order" do
      order_response = json_response[:order]
      expect(order_response[:total].to_f).to eql @order.total.to_f
    end

    it "includes the products on the order" do
      order_response = json_response[:order]
      expect(order_response[:products]).to have(1).item
    end

    it { should respond_with 200 }
  end

end
