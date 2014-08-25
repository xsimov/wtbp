class BandsController < ApplicationController

  def new
    @band = Band.new
    @band.parse_styles
  end

  def index
    @bands = Band.all
  end

  def create
    @band = Band.new band_params
    @band.members << current_user
    @band.save!
    redirect_to band_path(@band)
  rescue
    render 'new'
  end

  def edit
    @band = Band.find(params[:id])
  end

  def show
    @band = Band.find(params[:id])
    @concert = Concert.new
  end

  def addmember
    json_to_fields
    band = Band.find(@band_id)
    band.add_a_member(@username)
    band.add_position(@username, @position)
    render text: "OK", status: 200
  end

  def members
    band = Band.find(params[:id])
    @members = band.get_members_with_position
  end

  private

  def band_params
    params.require(:band).permit(:name, :year, styles: [])
  end

  def json_to_fields
    params = JSON.parse(request.body.read)
    @band_id = params["band_id"]
    @username = params["username"]
    @position = params["position"]
  end
end