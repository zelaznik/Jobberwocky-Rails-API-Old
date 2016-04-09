require "spec_helper"

describe Static::CompaniesController do
  describe "routing" do

    it "routes to #index" do
      get("/companies").should route_to("static/companies#index")
    end

    it "routes to #new" do
      get("/companies/new").should route_to("static/companies#new")
    end

    it "routes to #show" do
      get("/companies/1").should route_to("static/companies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/companies/1/edit").should route_to("static/companies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/companies").should route_to("static/companies#create")
    end

    it "routes to #update" do
      put("/companies/1").should route_to("static/companies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/companies/1").should route_to("static/companies#destroy", :id => "1")
    end

  end
end
