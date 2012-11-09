require "spec_helper"

describe QuestionGroupsController do
  describe "routing" do

    it "routes to #index" do
      get("/question_groups").should route_to("question_groups#index")
    end

    it "routes to #new" do
      get("/question_groups/new").should route_to("question_groups#new")
    end

    it "routes to #show" do
      get("/question_groups/1").should route_to("question_groups#show", :id => "1")
    end

    it "routes to #edit" do
      get("/question_groups/1/edit").should route_to("question_groups#edit", :id => "1")
    end

    it "routes to #create" do
      post("/question_groups").should route_to("question_groups#create")
    end

    it "routes to #update" do
      put("/question_groups/1").should route_to("question_groups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/question_groups/1").should route_to("question_groups#destroy", :id => "1")
    end

  end
end
