class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :ar_title
      t.string :en_title
      t.text :description
      t.boolean :premium
      t.boolean :active
      t.string :video_id
      t.string :video_host
      t.string :slug
      t.string :instructor
      t.boolean :new
      t.string :level

      t.timestamps null: false
    end
    add_index :videos, :slug, unique: true
  end
end
