require 'spec_helper'

describe Api::V1::UsersController do
  describe "GET #show" do
    before(:each) do
      @user = FactoryGirl.create :user
      get :show, id: @user.id
    end

    it "returns the information about a reporter on a hash" do
      user_response = json_response[:user]
      expect(user_response[:email]).to eql @user.email
    end

    it "has the product ids as an embedded object" do
      user_response = json_response[:user]
      expect(user_response[:product_ids]).to eql []
    end

    it { should respond_with 200 }
  end

  describe "GET #index" do
    before(:each) do
      @expected = User.count
      4.times do
        FactoryGirl.create :user
        @expected += 1
      end
      get :index
    end

    it "returns 4 records from the database" do
      expect(json_response[:users]).to have(@expected).items
    end

    it "returns product ids for each user" do
      json_response[:users].each do |user|
        expected = User.find(user[:id]).products.map(&:id).sort
        expect(user[:product_ids].sort).to eql expected
      end
    end

    it "does not pass the auth_token" do
      json_response[:users].each do |user|
        expect(user[:auth_token]).to eql nil
      end
    end

    it "does not pass the password" do
      json_response[:users].each do |user|
        expect(user[:password]).to eql nil
      end
    end

    it { should respond_with 200 }
  end

  describe "POST #create" do
    context "when is successfully created" do
      before(:each) do
        @user_attributes = FactoryGirl.attributes_for :user
        post :create, { user: @user_attributes }
      end

      it "renders the json representation for the user record just created" do
        user_response = json_response[:user]
        expect(user_response[:email]).to eql @user_attributes[:email]
      end

      it { should respond_with 201 }
    end

    context "when is not created" do
      before(:each) do
        @invalid_user_attributes = { password: "12345678", password_confirmation: "12345678" }
        post :create, { user: @invalid_user_attributes }
      end

      it "renders an errors json" do
        user_response = json_response
        expect(user_response).to have_key(:errors)
      end

      it "renders the json errors on whye the user could not be created" do
        user_response = json_response
        expect(user_response[:errors][:email]).to include "can't be blank"
      end

      it { should respond_with 422 }
    end
  end

  describe "PUT/PATCH #update" do
    before(:each) do
      @user = FactoryGirl.create :user
      api_authorization_header @user.auth_token
    end

    context "when is successfully updated" do
      before(:each) do
        patch :update, { id: @user.id, user: { email: "newmail@example.com" } }
      end

      it "renders the json representation for the updated user" do
        user_response = json_response[:user]
        expect(user_response[:email]).to eql "newmail@example.com"
      end

      it { should respond_with 200 }
    end

    context "when is not created" do
      before(:each) do
        patch :update, { id: @user.id, user: { email: "bad-email" } }
      end

      it "renders an errors json" do
        user_response = json_response
        expect(user_response).to have_key(:errors)
      end

      it "renders the json errors on whye the user could not be created" do
        user_response = json_response
        expect(user_response[:errors][:email]).to include "is invalid"
      end

      it { should respond_with 422 }
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @user = FactoryGirl.create :user
      api_authorization_header @user.auth_token
      delete :destroy, id: @user.auth_token
    end

    it { should respond_with 204 }

  end
end
