class ConcertsController < ApplicationController

  def show
  end

  def create
    band = Band.find(params[:band_id])
    concert = Concert.new concert_params
    concert.band_id = band.id
    concert.save!
    redirect_to band_concert_path(concert.band_id, concert.id)
  end

  private
  def concert_params
    params.require(:concert).permit(:date, :hour, :place, :additional_info)
  end

end