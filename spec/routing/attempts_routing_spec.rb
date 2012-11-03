require "spec_helper"

describe AttemptsController do
  describe "routing" do

    it "routes to #index" do
      get("/attempts").should route_to("attempts#index")
    end

    it "routes to #new" do
      get("/attempts/new").should route_to("attempts#new")
    end

    it "routes to #show" do
      get("/attempts/1").should route_to("attempts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/attempts/1/edit").should route_to("attempts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/attempts").should route_to("attempts#create")
    end

    it "routes to #update" do
      put("/attempts/1").should route_to("attempts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/attempts/1").should route_to("attempts#destroy", :id => "1")
    end

  end
end
