require 'rails_helper'

RSpec.describe MusiciansController, :type => :controller do

  context 'create action' do
    
    it "redirects to the user page the data was valid" do
      musician = FactoryGirl.build(:musician)
      expect(musician).to be_valid
      post :create, musician: musician.attributes
      new_musician = Musician.find_by(email: musician.email)
      expect(response).to redirect_to(musician_path(new_musician))
    end

    it "renders again the new form if the data is not valid with that data" do
      musician = Musician.new username: "blublublu"
      post :create, musician: musician.attributes
      expect(response).to render_template(:new)
      expect(assigns(:musician)).to be_a_new(Musician)
    end
  end

end