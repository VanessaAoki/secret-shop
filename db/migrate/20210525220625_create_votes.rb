class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.integer "article_id"
      t.integer "author_id"

      t.timestamps
    end
    add_index :votes, :author_id 
    add_index :votes, :article_id 
  end
end
