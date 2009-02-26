class GamesActAsTree < ActiveRecord::Migration
  def self.up
    add_column :games, :previous_game_id, :integer
  end

  def self.down
    remove_column :games, :previous_game_id
  end
end
