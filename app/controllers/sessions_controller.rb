class SessionsController < ApplicationController

  def create
    if authed_musician
      set_current_user(authed_musician)
      redirect_to musician_path(current_user)
    else
      flash[:alert] = "Invalid username or password"
      redirect_to new_musician_path
    end
  end

  def destroy
    session[:musician_id] = nil
    flash[:notice] = "Signed out successfully, hope to see you soon! :)"
    redirect_to root_path
  end

  private
  def authed_musician
    Musician.find_by(username: params['username']).try(:authenticate, params['password'])
  end
end