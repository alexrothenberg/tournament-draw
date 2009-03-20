class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.integer :next_game_id
      t.integer :winner_id

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
