class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def welcome
    render 'layouts/welcome'
  end

  def current_user
    Musician.find(session[:user_id]) unless session[:user_id].nil?
  end

  def notice
    flash[:notice] if flash[:notice]
  end

  def alert
    flash[:alert] if flash[:alert]
  end
end
