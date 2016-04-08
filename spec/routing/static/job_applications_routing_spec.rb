require "spec_helper"

describe Static::JobApplicationsController do
  describe "routing" do

    it "routes to #index" do
      get("/static/job_applications").should route_to("static/job_applications#index")
    end

    it "routes to #new" do
      get("/static/job_applications/new").should route_to("static/job_applications#new")
    end

    it "routes to #show" do
      get("/static/job_applications/1").should route_to("static/job_applications#show", :id => "1")
    end

    it "routes to #edit" do
      get("/static/job_applications/1/edit").should route_to("static/job_applications#edit", :id => "1")
    end

    it "routes to #create" do
      post("/static/job_applications").should route_to("static/job_applications#create")
    end

    it "routes to #update" do
      put("/static/job_applications/1").should route_to("static/job_applications#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/static/job_applications/1").should route_to("static/job_applications#destroy", :id => "1")
    end

  end
end
