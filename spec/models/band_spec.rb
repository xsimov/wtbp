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
end