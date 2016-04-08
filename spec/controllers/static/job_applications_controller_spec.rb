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

describe Static::JobApplicationsController do

  # This should return the minimal set of attributes required to create a valid
  # JobApplication. As you add validations to JobApplication, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "company" => "" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Static::JobApplicationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all job_applications as @job_applications" do
      job_application = JobApplication.create! valid_attributes
      get :index, {}, valid_session
      assigns(:job_applications).should eq([job_application])
    end
  end

  describe "GET show" do
    it "assigns the requested job_application as @job_application" do
      job_application = JobApplication.create! valid_attributes
      get :show, {:id => job_application.to_param}, valid_session
      assigns(:job_application).should eq(job_application)
    end
  end

  describe "GET new" do
    it "assigns a new job_application as @job_application" do
      get :new, {}, valid_session
      assigns(:job_application).should be_a_new(JobApplication)
    end
  end

  describe "GET edit" do
    it "assigns the requested job_application as @job_application" do
      job_application = JobApplication.create! valid_attributes
      get :edit, {:id => job_application.to_param}, valid_session
      assigns(:job_application).should eq(job_application)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new JobApplication" do
        expect {
          post :create, {:job_application => valid_attributes}, valid_session
        }.to change(JobApplication, :count).by(1)
      end

      it "assigns a newly created job_application as @job_application" do
        post :create, {:job_application => valid_attributes}, valid_session
        assigns(:job_application).should be_a(JobApplication)
        assigns(:job_application).should be_persisted
      end

      it "redirects to the created job_application" do
        post :create, {:job_application => valid_attributes}, valid_session
        response.should redirect_to(JobApplication.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved job_application as @job_application" do
        # Trigger the behavior that occurs when invalid params are submitted
        JobApplication.any_instance.stub(:save).and_return(false)
        post :create, {:job_application => { "company" => "invalid value" }}, valid_session
        assigns(:job_application).should be_a_new(JobApplication)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        JobApplication.any_instance.stub(:save).and_return(false)
        post :create, {:job_application => { "company" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested job_application" do
        job_application = JobApplication.create! valid_attributes
        # Assuming there are no other job_applications in the database, this
        # specifies that the JobApplication created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        JobApplication.any_instance.should_receive(:update).with({ "company" => "" })
        put :update, {:id => job_application.to_param, :job_application => { "company" => "" }}, valid_session
      end

      it "assigns the requested job_application as @job_application" do
        job_application = JobApplication.create! valid_attributes
        put :update, {:id => job_application.to_param, :job_application => valid_attributes}, valid_session
        assigns(:job_application).should eq(job_application)
      end

      it "redirects to the job_application" do
        job_application = JobApplication.create! valid_attributes
        put :update, {:id => job_application.to_param, :job_application => valid_attributes}, valid_session
        response.should redirect_to(job_application)
      end
    end

    describe "with invalid params" do
      it "assigns the job_application as @job_application" do
        job_application = JobApplication.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        JobApplication.any_instance.stub(:save).and_return(false)
        put :update, {:id => job_application.to_param, :job_application => { "company" => "invalid value" }}, valid_session
        assigns(:job_application).should eq(job_application)
      end

      it "re-renders the 'edit' template" do
        job_application = JobApplication.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        JobApplication.any_instance.stub(:save).and_return(false)
        put :update, {:id => job_application.to_param, :job_application => { "company" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested job_application" do
      job_application = JobApplication.create! valid_attributes
      expect {
        delete :destroy, {:id => job_application.to_param}, valid_session
      }.to change(JobApplication, :count).by(-1)
    end

    it "redirects to the job_applications list" do
      job_application = JobApplication.create! valid_attributes
      delete :destroy, {:id => job_application.to_param}, valid_session
      response.should redirect_to(job_applications_url)
    end
  end

end
