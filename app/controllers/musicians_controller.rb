class MusiciansController < ApplicationController

  def new
    @musician = Musician.new
  end

  def create
    new_musician = Musician.new musician_params
    new_musician.save!
    redirect_to musician_path(new_musician)
  rescue ActiveRecord::RecordInvalid
    @musician = new_musician
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