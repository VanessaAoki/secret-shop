class AddVotesCount < ActiveRecord::Migration[6.1]
  def change
    add_column :votes, :votes_count, :integer, default: 0
  end
end
