class AddCourseIdToEpisodes < ActiveRecord::Migration
  def change
    add_reference :episodes, :course, index: true, foreign_key: true
  end
end
