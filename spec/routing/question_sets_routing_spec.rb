require "spec_helper"

describe QuestionSetsController do
  describe "routing" do

    it "routes to #index" do
      get("/question_sets").should route_to("question_sets#index")
    end

    it "routes to #new" do
      get("/question_sets/new").should route_to("question_sets#new")
    end

    it "routes to #show" do
      get("/question_sets/1").should route_to("question_sets#show", :id => "1")
    end

    it "routes to #edit" do
      get("/question_sets/1/edit").should route_to("question_sets#edit", :id => "1")
    end

    it "routes to #create" do
      post("/question_sets").should route_to("question_sets#create")
    end

    it "routes to #update" do
      put("/question_sets/1").should route_to("question_sets#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/question_sets/1").should route_to("question_sets#destroy", :id => "1")
    end

  end
end
