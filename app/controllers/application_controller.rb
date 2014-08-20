class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def welcome
    render 'layouts/welcome'
  end

  def current_user
    Musician.find(session[:user_id]) unless session[:user_id].nil?
  end

end
