class AddTotalVotesToReviews < ActiveRecord::Migration[5.0]
  def up
    add_column :reviews, :total_vote_count, :integer, null: false, default: 0
  end

  def down
    remove_column :reviews, :total_vote_count
  end
end
