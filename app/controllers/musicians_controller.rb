class MusiciansController < ApplicationController

  def new
    @musician = Musician.new
  end

  def create
    @musician = Musician.new musician_params
    @musician.save!
    redirect_to musician_path(@musician)
  rescue ActiveRecord::RecordInvalid
    render 'new'
  end

  def show
    @musician = Musician.find(params[:id])
  end

  private
  def musician_params
    params.require(:musician).permit(:username, :email)
  end

end