require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  context "the create action" do
    it "sets the current user if username and password match" do
      musician = FactoryGirl.create(:musician)
      post :create, { username: musician.username, password: musician.password }
      expect(session[:musician_id]).to eq(musician.id)
    end
  end

  context "the destroy action" do
      it "wipes out the session" do
        session[:musician_id] = 23
        delete :destroy
        expect(session[:musician_id]).to eq(nil)
      end
  end
end