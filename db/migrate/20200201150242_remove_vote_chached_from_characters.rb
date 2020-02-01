class RemoveVoteChachedFromCharacters < ActiveRecord::Migration[6.0]
  def change
    remove_column :characters, :cached_votes_total
    remove_column :characters, :cached_votes_score
    remove_column :characters, :cached_votes_up
    remove_column :characters, :cached_votes_down
    remove_column :characters, :cached_weighted_score
    remove_column :characters, :cached_weighted_total
    remove_column :characters, :cached_weighted_average
  end
end
