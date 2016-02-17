class SearchesController < ApplicationController
  def index
    @results = PgSearch.multisearch(params[:search])
    authorize @results
  end
end
