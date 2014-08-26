# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do
  FactoryGirl.create(:musician)
end

3.times do
  band = FactoryGirl.create(:band)
  7.times do
    band.members << Musician.order("RANDOM()").first
  end
  band.members.uniq
end

2.times do
  band = FactoryGirl.create(:band)
  7.times do
    band.members << Musician.order("RANDOM()").first
  end
  band.members.uniq
end

