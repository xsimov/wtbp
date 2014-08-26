class SearchController < ApplicationController

  before_filter :new_search

  def allfields
    @musicians = @search.musicians
    @bands = @search.bands
    @concerts = @search.concerts
    render '/layouts/search_results'
  end

  private
  def new_search
    @search = Search.new params[:query]
  end
end