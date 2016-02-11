class StaticPagesController < ApplicationController
  layout "static_pages"
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized

  def home
  end

  def privacy
  end

  def terms
  end
end
