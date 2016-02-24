class MainController < ApplicationController
  skip_after_action :verify_authorized

  def all
    @resources = [Course.get_courses(current_user), Article.get_articles(current_user)].flatten
    @resources = @resources.sort_by { |r| r["created_at"] }.reverse
  end
end
