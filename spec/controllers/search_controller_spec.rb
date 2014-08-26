require 'rails_helper'

RSpec.describe SearchController, :type => :controller do

  context "the allfields action" do
    it "exists" do
      post :allfields, { search: "" }
      expect(response.status).to eq(200)
    end

    it "assigns an empty array if search params were empty" do
      post :allfields, { search: "" }
      expect(assigns(:bands)).to eq([])
      expect(assigns(:musicians)).to eq([])
    end
  end

  context "the bands action" do
    it "exists" do
      post :bands
      expect(response.status).to eq(200)
    end

    it "passes the results to the view" do
      band = FactoryGirl.create(:band, name: "Illegal Jamms")
      post :bands, { search: "jamms" }
      expect(assigns(:bands)).to eq([band])
    end
  end

  context "the musicians action" do
    it "exists" do
      post :musicians
      expect(response.status).to eq(200)
    end

    it "passes the searched result to the view" do
      musician = FactoryGirl.create(:musician, first_name: "Kail", last_name: "Leclerc")
      post :musicians, { search: "clerc" }
      expect(assigns(:musicians)).to eq([musician])
    end
  end
end