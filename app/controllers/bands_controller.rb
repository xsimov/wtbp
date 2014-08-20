class BandsController < ApplicationController

  def new
    @band = Band.new
    parse_styles
  end

  def create
    @band = Band.new band_params
    @band.save!
    redirect_to band_path(@band)
  rescue
    render 'new'
  end

  def edit
    @band = Band.find(params[:id])
  end

  def show
    
  end

  private

  def parse_styles
    styles_str = ""
    @band.styles.each do |style|
      styles_str += style + ", "
    end
    @band.styles = styles_str[0..-3]
  end

  def band_params
    params.require(:band).permit(:name, :year, styles: [])
  end
end