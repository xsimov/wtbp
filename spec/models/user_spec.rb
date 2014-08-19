require 'rails_helper'

describe "the User" do
  it "has a first name" do
    user = create(:user)
    expect(user).to be_valid
  end
end