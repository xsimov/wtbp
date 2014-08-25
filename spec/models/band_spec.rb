require 'rails_helper'

RSpec.describe Band, :type => :model do

  context 'the styles parser method' do
    it "converts the styles array into a comma separated string" do
      band = FactoryGirl.create(:band_with_many_styles)
      expect(band.parse_styles).to be_a(String)
    end
  end

  context "the add_a_member method" do
    before :each do
      @musician = FactoryGirl.create(:musician)
      @band = FactoryGirl.create(:band)
      @band.add_a_member(@musician.username)
    end

    it "adds the passed member to the band musicians relation" do
      expect(@band.members).to include(@musician)
    end

    it "doesn't add the passed member if it already is part of it" do
      @band.add_a_member(@musician.username)
      expect(@band.members.count).to eq(1)
    end
  end

  context "the add_position method" do

    before :each do
      create_a_band_with_musicians(1)
    end

    it "sets the position for a band and member" do
      @band.add_position(@musician.username, "keys")
      @musician.get_position(@band.id)
      expect(@musician.position).to eq("keys")
    end
  end

  context "the get_members_with_position method" do

    before :each do
      create_a_band_with_musicians
      @members = @band.get_members_with_position
    end

    it "retrieves a list of musicians" do
      3.times.with_index do |i|
        expect(@members[i]).to be_a(Musician)
      end
    end

    it "gets musicians with a position" do
      3.times.with_index do |i|
        expect(@members[i].position).not_to be_nil
      end
    end

  end
end