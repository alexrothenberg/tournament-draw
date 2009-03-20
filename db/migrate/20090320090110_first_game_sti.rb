class FirstGameSti < ActiveRecord::Migration
  def self.up
    add_column :games, :type, :string

    add_column :games, :player1_id, :integer
    add_column :games, :player2_id, :integer
  end

  def self.down
    remove_colun :games, :type
    remove_colun :games, :player1_id
    remove_colun :games, :player2_id
  end
end
