class SearchController < ApplicationController

  before_filter :new_search

  def allfields
    @musicians = @search.musicians
    @bands = @search.bands
    render '/layouts/search_results'
  end

  private
  def new_search
    @search = Search.new params[:search]
  end
end