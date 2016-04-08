require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe Static::StatusesController do

  # This should return the minimal set of attributes required to create a valid
  # Status. As you add validations to Status, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "label" => "MyText" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Static::StatusesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all static_statuses as @statuses" do
      status = Status.create! valid_attributes
      get :index, {}, valid_session
      assigns(:static_statuses).should eq([status])
    end
  end

  describe "GET show" do
    it "assigns the requested static_status as @status" do
      status = Status.create! valid_attributes
      get :show, {:id => status.to_param}, valid_session
      assigns(:static_status).should eq(status)
    end
  end

  describe "GET new" do
    it "assigns a new static_status as @status" do
      get :new, {}, valid_session
      assigns(:static_status).should be_a_new(Status)
    end
  end

  describe "GET edit" do
    it "assigns the requested static_status as @status" do
      status = Status.create! valid_attributes
      get :edit, {:id => status.to_param}, valid_session
      assigns(:static_status).should eq(status)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Status" do
        expect {
          post :create, {:static_status => valid_attributes}, valid_session
        }.to change(Status, :count).by(1)
      end

      it "assigns a newly created static_status as @status" do
        post :create, {:static_status => valid_attributes}, valid_session
        assigns(:static_status).should be_a(Status)
        assigns(:static_status).should be_persisted
      end

      it "redirects to the created static_status" do
        post :create, {:static_status => valid_attributes}, valid_session
        response.should redirect_to(Status.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved static_status as @status" do
        # Trigger the behavior that occurs when invalid params are submitted
        Status.any_instance.stub(:save).and_return(false)
        post :create, {:static_status => { "label" => "invalid value" }}, valid_session
        assigns(:static_status).should be_a_new(Status)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Status.any_instance.stub(:save).and_return(false)
        post :create, {:static_status => { "label" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested static_status" do
        status = Status.create! valid_attributes
        # Assuming there are no other static_statuses in the database, this
        # specifies that the Status created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Status.any_instance.should_receive(:update).with({ "label" => "MyText" })
        put :update, {:id => status.to_param, :static_status => { "label" => "MyText" }}, valid_session
      end

      it "assigns the requested static_status as @status" do
        status = Status.create! valid_attributes
        put :update, {:id => status.to_param, :static_status => valid_attributes}, valid_session
        assigns(:static_status).should eq(status)
      end

      it "redirects to the static_status" do
        status = Status.create! valid_attributes
        put :update, {:id => status.to_param, :static_status => valid_attributes}, valid_session
        response.should redirect_to(status)
      end
    end

    describe "with invalid params" do
      it "assigns the static_status as @status" do
        status = Status.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Status.any_instance.stub(:save).and_return(false)
        put :update, {:id => status.to_param, :static_status => { "label" => "invalid value" }}, valid_session
        assigns(:static_status).should eq(status)
      end

      it "re-renders the 'edit' template" do
        status = Status.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Status.any_instance.stub(:save).and_return(false)
        put :update, {:id => status.to_param, :static_status => { "label" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested static_status" do
      status = Status.create! valid_attributes
      expect {
        delete :destroy, {:id => status.to_param}, valid_session
      }.to change(Status, :count).by(-1)
    end

    it "redirects to the static_statuses list" do
      status = Status.create! valid_attributes
      delete :destroy, {:id => status.to_param}, valid_session
      response.should redirect_to(static_statuses_url)
    end
  end

end
