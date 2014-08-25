require 'rails_helper'

RSpec.describe Musician, :type => :model do

  context "the get_position method" do

    before :each do
      create_a_band_with_musicians(1)
      @musician = @musicians[0]
      @band.add_position(@musician.username, "piano")
    end

    it "given a band it searches for that musicians position" do
      @musician.get_position(@band.id)
      expect(@musician.position).to eq("piano")
    end
  end

end