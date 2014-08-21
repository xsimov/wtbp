class MusiciansController < ApplicationController

  def new
    @musician = Musician.new
  end

  def index
    @musicians = Musician.all
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
    set_current_user(@musician)
  end

  private
  def musician_params
    params.require(:musician).permit(:username, :email)
  end

  def set_current_user(user)
    session[:user_id]=user.id
  end

end