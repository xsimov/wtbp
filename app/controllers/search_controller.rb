class SearchController < ApplicationController

  before_filter :new_search

  def allfields
    @musicians = @search.musicians
    @bands = @search.bands
    render '/layouts/search_results'
  end

  def bands
    @bands = @search.bands
    render 'layouts/bands_search_results'
  end

  def musicians
    @musicians = @search.musicians
    render 'layouts/musicians_search_results'
  end

  private
  def new_search
    @search = Search.new params[:search]
  end
end