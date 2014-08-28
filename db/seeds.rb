# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

yuri = Musician.create(username: "jned", email: "jned@example.com", first_name: "Judit", last_name: "Neddermann", password: "12345678", aliases: ["None"])

jo = Musician.create(username: "xsimov", email: "xsimov@example.com",first_name: "Xavier",last_name: "Simó",password: "12345678",aliases: ["kail", "xsimov"])

sergio = Musician.create(username: "elreplicante", email: "elreplicante@example.com",first_name: "Sergio",last_name: "Revilla",password: "12345678",aliases: ["el Replicante"])

sergi = Musician.create(username: "sltj", email: "sltj@example.com",first_name: "Sergi",last_name: "Garcia",password: "12345678",aliases: ["the first bassplayer"])

ramon = Musician.create(username: "ramod", email: "rx@example.com",first_name: "Ramon",last_name: "Xuriguera",password: "12345678",aliases: ["Ramon Xuriguera", "Ramod", "Moncho"])

jn = Band.create(name: "Judit Neddermann", year: 2014, styles: ["Pop", "Jazz", "Songwriting"])

ij = Band.create(name: "Illegal Jamms", year: 2008, styles: ["Ska-Jazz", "Jazz"])

dds = Band.create(name: "2 out of 6", year: 2007, styles: ["Jazz", "Ballads", "Bossanova"])

eh = Band.create(name: "Emerson Happy", year: 2013, styles: ["Contemporary Jazz", "Jazz", "Experimental"])

rep = Band.create(name: "Reply Music", year: 2006, styles: ["Electronic"])

cool = Band.create(name: "Coolectronic-Jazz", year: 2014, styles: ["Electronic-Jazz", "Experimental"])



[sergio, jo].each do |musician|
  cool.members << musician
end

[yuri].each do |musician|
  jn.members << musician
end

[sergi, jo].each do |musician|
  dds.members << musician
  eh.members << musician
end

eh.members << ramon

[sergi, jo, yuri, ramon].each do |musician|
  ij.members << musician
end

[sergio].each do |musician|
  rep.members << musician
end


jn.add_position("jned", "Voice, guitar and composer")
ij.add_position("jned", "Leading voice")
ij.add_position("sltj", "Bass")
ij.add_position("xsimov", "Keyboards, voices")
ij.add_position("ramod", "Tenor Sax")
dds.add_position("sltj", "Drums")
dds.add_position("xsimov", "Piano and voice")
rep.add_position("elreplicante", "Electronics")
cool.add_position("xsimov", "Piano")
cool.add_position("elreplicante", "Musician Master")
eh.add_position("sltj", "Bass")
eh.add_position("ramod", "Tenor Sax and Soprano Sax")
eh.add_position("xsimov", "Keyboard and composer")
