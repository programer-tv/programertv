class AddNewFlagToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :new, :boolean
  end
end
