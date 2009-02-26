class Game < ActiveRecord::Base
  acts_as_tree :foreign_key=>:previous_game_id
  
  alias_method :previous_games, :children
  alias_method :game_for_winner, :parent
  
  belongs_to :player1, :class_name=>'Player'
  belongs_to :player2, :class_name=>'Player'
  
  def self.final
    self.root.children[0]
  end

  def first_players_previous_game
    self.children[0]
  end
  
  def second_players_previous_game
    self.children[1]
  end
  
  def round
    return 1 if first_players_previous_game.nil?
    1 + first_players_previous_game.round
  end
  
  def self.round_in_words(round)
    games_before_final = Game.final.round - round
    case games_before_final
    when 0
      'Finals'
    when 1
      'Semifinals'
    when 2
      'Quarterfinals'
    when 3
      'Round of 16'
    else
      round.ordinalize
    end
  end
  
  def winner
    # return nil if game_for_winner.nil?
    game_for_winner.first_players_previous_game == self ? game_for_winner.player1 : game_for_winner.player2
  end
  def winner_id= player_id
    # return nil if game_for_winner.nil?
    if game_for_winner.first_players_previous_game == self 
      game_for_winner.player1_id = player_id 
    else
      game_for_winner.player2_id = player_id
    end
    game_for_winner.save
  end
  
  def self.first_round
    find_leaves([final]).flatten
  end
  
protected  

  def self.find_leaves roots
    leaves = []
    roots.each do |game|
      if game.children.empty?
        leaves << game
      else
        leaves << find_leaves(game.children)
      end 
    end
    leaves
  end
  
end
