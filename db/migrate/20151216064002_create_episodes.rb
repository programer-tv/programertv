class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :en_title
      t.string :ar_title
      t.text :description
      t.integer :sequence
      t.string :video_host
      t.string :video_id

      t.timestamps null: false
    end
  end
end
