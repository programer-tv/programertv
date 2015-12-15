class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :ar_title
      t.string :en_title
      t.text :description
      t.boolean :premium, default: false
      t.boolean :active, default: false
      t.string :video_id
      t.string :video_host

      t.timestamps null: false
    end
  end
end
