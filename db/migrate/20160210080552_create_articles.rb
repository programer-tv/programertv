class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :en_title
      t.string :ar_title
      t.string :author
      t.text :content
      t.boolean :active

      t.timestamps null: false
    end
  end
end
