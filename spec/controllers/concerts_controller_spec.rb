require 'rails_helper'

RSpec.describe ConcertsController, :type => :controller do

  context 'the show action' do
    it "has status ok" do
      concert = FactoryGirl.create(:concert)
      get :show, {id: concert.id, band_id: concert.band_id}
      expect(response.status).to eq(200)
    end
  end

  context 'the create action' do
    it "redirects to the show concert if data is valid" do
      concert = FactoryGirl.build(:concert)
      expect(concert).to be_valid
      post :create, {concert: concert.attributes, band_id: concert.band_id}
      new_concert = Concert.find_by_place(concert.place)
      expect(response).to redirect_to(band_concert_path(new_concert.band_id, new_concert.id))
    end
  end

end