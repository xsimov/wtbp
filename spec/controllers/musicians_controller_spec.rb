require 'rails_helper'

RSpec.describe MusiciansController, :type => :controller do

  context "the create action" do
    
    it "redirects to the user page if the data is valid" do
      musician = FactoryGirl.build(:musician)
      expect(musician).to be_valid
      post :create, musician: musician.attributes
      new_musician = Musician.find_by(email: musician.email)
      expect(response).to redirect_to(musician_path(new_musician))
    end

    it "renders again the new form if the data is not valid with that data" do
      musician = Musician.new username: "blublublu"
      expect(musician).not_to be_valid
      post :create, musician: musician.attributes
      expect(response).to render_template(:new)
      expect(assigns(:musician)).to be_a_new(Musician)
    end

  end

  context "the index action" do
    it "has a view to render" do
      get :index
      expect(response).to render_template(:index)
    end

    it "passes a variable to the view with all the musicians" do
      get :index
      expect(assigns(:musicians)).to eq(Musician.all)
    end
  end

end