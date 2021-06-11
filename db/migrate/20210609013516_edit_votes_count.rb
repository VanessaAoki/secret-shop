class EditVotesCount < ActiveRecord::Migration[6.1]
  def change
    remove_column :votes, :votes_count, :integer, default: 0
    add_column :articles, :votes_count, :integer, default: 0
  end
end
