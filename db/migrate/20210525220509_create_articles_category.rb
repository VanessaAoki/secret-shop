class CreateArticlesCategory < ActiveRecord::Migration[6.1]
  def change
    create_table :articles_categories do |t|
      t.string "name"
      t.integer "priority"

      t.timestamps
    end
  end
end
