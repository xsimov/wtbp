require 'rails_helper'

RSpec.describe BandsController, :type => :controller do

  context 'new action' do
    it "has status ok" do
      get :new
      expect(response.status).to eq(200)
    end
  end

  context 'create action' do
    it "redirects to the band profile page if the data is valid" do
      band = FactoryGirl.build(:band_with_many_styles)
      expect(band).to be_valid
      post :create, band: band.attributes
      new_band = Band.find_by(name: band.name)
      expect(response).to redirect_to(band_path(new_band))
    end

    it "renders again the new form if the data is not valid with that data" do
      band = Band.new name: "blublublu", year: 2346235
      expect(band).not_to be_valid
      post :create, band: band.attributes

      expect(assigns(:band)).to be_a_new(Band)
      expect(response).to render_template(:new)
    end
  end

  context 'edit action' do
    it "parses the styles array into a string" do
      @band = FactoryGirl.create(:band_with_many_styles)
      get :edit, id: @band.id
      expect(assigns(:band)).to eq(@band)
    end
  end

end