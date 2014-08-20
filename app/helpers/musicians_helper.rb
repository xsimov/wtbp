module MusiciansHelper

  def display_instruments_list
    warning = Instrument.new name: "No instruments added yet."
    return [warning] if @musician.instruments.empty?
    @musician.instruments
  end
  
end