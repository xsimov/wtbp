require 'rails_helper'

RSpec.describe Concert, :type => :model do

  context "the parse_hour method" do

    before :each do
      @concert = FactoryGirl.create(:concert)
    end

    it "returns a string" do
      expect(@concert.parse_hour).to be_a(String)
    end

    it "has always a fixed length of 6 characters" do
      expect(@concert.parse_hour.length).to eq(6)
    end
  end

end