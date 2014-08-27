class SessionsController < ApplicationController

  def create
    set_current_user(authed_musician) if authed_musician
    redirect_to musician_path(current_user)
  end

  private
  def authed_musician
    Musician.find_by(username: params['username']).try(:authenticate, params['password'])
  end
end