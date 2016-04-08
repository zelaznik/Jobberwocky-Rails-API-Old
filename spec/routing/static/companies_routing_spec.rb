require "spec_helper"

describe Static::CompaniesController do
  describe "routing" do

    it "routes to #index" do
      get("/static/companies").should route_to("static/companies#index")
    end

    it "routes to #new" do
      get("/static/companies/new").should route_to("static/companies#new")
    end

    it "routes to #show" do
      get("/static/companies/1").should route_to("static/companies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/static/companies/1/edit").should route_to("static/companies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/static/companies").should route_to("static/companies#create")
    end

    it "routes to #update" do
      put("/static/companies/1").should route_to("static/companies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/static/companies/1").should route_to("static/companies#destroy", :id => "1")
    end

  end
end
