class ChangeSlugIndexScopeInEpisodes < ActiveRecord::Migration
  def change
    remove_index :episodes, :slug
    add_index :episodes, [:slug, :course_id], unique: true
  end
end
