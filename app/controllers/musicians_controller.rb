class MusiciansController < ApplicationController

  def new
    @musician = Musician.new
  end

  def index
    @musicians = Musician.all
  end

  def create
    if password_match_confirmation?
      @musician = Musician.new musician_params
      @musician.save!
      flash["notice"] = "Thanks for registering! Have fun discovering new music!"
      redirect_to musician_path(@musician)
    else
      render 'new'
    end
  rescue ActiveRecord::RecordInvalid
    render 'new'
  end

  def show
    @musician = Musician.find(params[:id])
  end

  private
  def musician_params
    params.require(:musician).permit(:username, :email, :password, :password_confirmation)
  end

  def password_match_confirmation?
    params['musician']['password'] == params['musician']['password_confirmation']
  end
end