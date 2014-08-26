require 'rails_helper'

RSpec.describe BandsController, :type => :controller do

  context 'new action' do
    it "has status ok" do
      get :new
      expect(response.status).to eq(200)
    end
  end

  context 'create action' do

    before :each do
      musician = FactoryGirl.create(:musician)
      session[:user_id] = musician.id
    end
    
    it "redirects to the band profile page if the data is valid" do
      band = FactoryGirl.build(:band)
      expect(band).to be_valid
      post :create, band: band.attributes

      new_band = Band.find_by(name: band.name)
      expect(response).to redirect_to(band_path(new_band.id))
    end

    it "renders again the new form if the data is not valid with that data" do
      band = Band.new name: "blublublu", year: 2346235
      expect(band).not_to be_valid
      post :create, band: band.attributes

      expect(assigns(:band)).to be_a_new(Band)
      expect(response).to render_template(:new)
    end

    it "automatically sets the creating musician as a member of the band" do
      band = FactoryGirl.build(:band)
      post :create, band: band.attributes
      band = Band.find_by(name: band.name)
      expect(band.musicians).to include()
    end
  end

  context 'edit action' do
    it "parses the styles array into a string" do
      @band = FactoryGirl.create(:band)
      get :edit, id: @band.id
      expect(assigns(:band)).to eq(@band)
    end
  end

  context "the index action" do
    it "renders its view" do
      get :index
      expect(response).to render_template(:index)
    end

    it "passes a variable to the view with all the bands" do
      get :index
      expect(assigns(:bands)).to eq(Band.all)
    end
  end

end