require 'rails_helper'

RSpec.describe Search, :type => :model do

  it "returns an array" do
    search = Search.new ""
    expect(search.musicians).to be_an(Array)
    expect(search.bands).to be_an(Array)
  end

  it "is not case sensitive" do
    kail = FactoryGirl.create(:musician, last_name: "Laurence")
    band = FactoryGirl.create(:band, name: "Illegal Jamms")

    search_upper = Search.new "Laurence"
    search_lower = Search.new "laurence"
    expect(search_upper.musicians).to eq([kail])
    expect(search_lower.musicians).to eq([kail])

    search_upper = Search.new "Illegal Jamms"
    search_lower = Search.new "illegal Jamms"
    expect(search_upper.bands).to eq([band])
    expect(search_lower.bands).to eq([band])
  end

  it "matches incomplete fields" do
    kail = FactoryGirl.create(:musician, last_name: "di Laurence")
    band = FactoryGirl.create(:band, name: "Illegal Jamms")

    search_upper = Search.new "laurence"
    expect(search_upper.musicians).to eq([kail])

      search_upper = Search.new "Illegal"
    expect(search_upper.bands).to eq([band])
  end

  context "the musicians method" do
    it "searches by first name" do
      kail = FactoryGirl.create(:musician, first_name: "George")
      search = Search.new "George"
      expect(search.musicians).to eq([kail])
    end

    it "searches by last name" do
      kail = FactoryGirl.create(:musician, last_name: "Benson")
      search = Search.new "Benson"
      expect(search.musicians).to eq([kail])
    end

    it "searches by alias" do
      kail = FactoryGirl.create(:musician, aliases: ["fer"])
      search = Search.new "FER"
      expect(search.musicians).to eq([kail])
    end
  end

  context "the bands method" do
    it "searches by band's name" do
      band = FactoryGirl.create(:band, name: "Illegal Jamms")
      search = Search.new "illegal jamms"
      expect(search.bands).to eq([band])
    end

    it "searches by band's styles" do
      band = FactoryGirl.create(:band, styles: ["Jazz"])
      search = Search.new "jazz"
      expect(search.bands).to eq([band])
    end
  end

end