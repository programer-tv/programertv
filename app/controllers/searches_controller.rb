class SearchesController < ApplicationController
  skip_after_action :verify_authorized

  def index
    if current_user.admin?
      @results = PgSearch.multisearch(params[:search])
    else
      results = PgSearch.multisearch(params[:search])
      @results = []
      results.each do |r|
        if r.searchable.active?
          @results << r
        end
      end
    end
    @results = @results.sort_by { |r| r["created_at"] }.reverse
  end
end
