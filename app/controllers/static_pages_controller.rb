class StaticPagesController < ApplicationController
  layout "static_pages"
  skip_before_action :authenticate_user!

  def home
  end
end
