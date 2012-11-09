require "spec_helper"

describe StudentGroupsController do
  describe "routing" do

    it "routes to #index" do
      get("/student_groups").should route_to("student_groups#index")
    end

    it "routes to #new" do
      get("/student_groups/new").should route_to("student_groups#new")
    end

    it "routes to #show" do
      get("/student_groups/1").should route_to("student_groups#show", :id => "1")
    end

    it "routes to #edit" do
      get("/student_groups/1/edit").should route_to("student_groups#edit", :id => "1")
    end

    it "routes to #create" do
      post("/student_groups").should route_to("student_groups#create")
    end

    it "routes to #update" do
      put("/student_groups/1").should route_to("student_groups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/student_groups/1").should route_to("student_groups#destroy", :id => "1")
    end

  end
end
