require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  context "the create action" do
    it "sets the current user if username and password match" do
      musician = FactoryGirl.create(:musician)
      post :create, { musician: { username: musician.username, password: musician.password } }
      expect(current_user).to eq(musician.id)
    end
  end
end