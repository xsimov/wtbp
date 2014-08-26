require 'rails_helper'

RSpec.describe Search, :type => :model do

  it "returns an array" do
    search = Search.new ""
    expect(search.musicians).to be_an(Array)
    expect(search.bands).to be_an(Array)
    expect(search.concerts).to be_an(Array)
  end

  it "is not case sensitive" do
    kail = FactoryGirl.create(:musician, last_name: "Laurence")
    search_upper = Search.new "Laurence"
    search_lower = Search.new "laurence"
    expect(search_upper.musicians).to eq([kail])
    expect(search_lower.musicians).to eq([kail])
  end

  context "the musicians method" do
    it "searches by first name" do
      kail = FactoryGirl.create(:musician, first_name: "George")
      search = Search.new "George"
      expect(search.musicians).to eq([kail])
    end

    it "searches by last name" do
      kail = FactoryGirl.create(:musician, last_name: "Smith")
      search = Search.new "Smith"
      expect(search.musicians).to eq([kail])
    end

    it "searches by alias" do
      kail = FactoryGirl.create(:musician, aliases: ["fer", "Senyor d'Arabia"])
      search = Search.new "FER"
      expect(search.musicians).to eq([kail])
    end
  end

end