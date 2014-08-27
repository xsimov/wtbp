module MusiciansHelper

  def display_instruments_list
    warning = Instrument.new name: "No instruments added yet."
    return [warning] if @musician.instruments.empty?
    @musician.instruments
  end

  def get_four_bands_of(musician)
    four_bands = "#{musician.bands.first.name}" if musician.bands.first
    3.times.with_index do |i|
      four_bands += ", #{musician.bands[i].name}" if musician.bands[i]
    end
    four_bands
  end

  def print_all_musicians
    Musician.all
  end
end