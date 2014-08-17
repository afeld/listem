require "rails_helper"

RSpec.describe ItemsController, :type => :routing do
  describe "routing" do
    it "routes to #create" do
      expect(:post => "/lists/1/items").to route_to("items#create", list_id: '1')
    end

    it "routes to #destroy" do
      expect(:delete => "/items/1").to route_to("items#destroy", id: '1')
    end
  end
end
