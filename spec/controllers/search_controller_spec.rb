require 'rails_helper'

RSpec.describe SearchController, :type => :controller do

  context "the allfields action" do

    it "exists" do
      post :allfields, { query: "" }
      expect(response.status).to eq(200)
    end

    it "assigns an empty array if search params were empty" do
      post :allfields, { query: "" }
      expect(assigns(:bands)).to eq([])
      expect(assigns(:concerts)).to eq([])
      expect(assigns(:musicians)).to eq([])
    end

  end

end