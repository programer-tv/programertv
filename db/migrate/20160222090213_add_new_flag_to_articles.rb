class AddNewFlagToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :new, :boolean
  end
end
