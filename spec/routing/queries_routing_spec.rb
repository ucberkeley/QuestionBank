require "spec_helper"

describe QueriesController do
  describe "routing" do

    it "routes to #index" do
      get("/queries").should route_to("queries#index")
    end

    it "routes to #new" do
      get("/queries/new").should route_to("queries#new")
    end

    it "routes to #show" do
      get("/queries/1").should route_to("queries#show", :id => "1")
    end

    it "routes to #edit" do
      get("/queries/1/edit").should route_to("queries#edit", :id => "1")
    end

    it "routes to #create" do
      post("/queries").should route_to("queries#create")
    end

    it "routes to #update" do
      put("/queries/1").should route_to("queries#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/queries/1").should route_to("queries#destroy", :id => "1")
    end

  end
end
