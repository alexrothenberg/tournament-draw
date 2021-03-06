class Game < ActiveRecord::Base
  acts_as_tree :foreign_key=>:next_game_id
  
  belongs_to :winner, :class_name=>'Player'

  alias_method :next_game, :parent

  def self.final
    self.root
  end
  
  
  def self.find_and_collect_by_round
    collection = {}
    round = self.final.round
    collection[round] = [self.final]
    while round > 0
      round = round - 1
      collection[round] = collect_previous_round collection[round+1]
    end    
    
    collection
  end
  
  def self.collect_previous_round games_in_round
    games_in_round.collect {|game| game.children}.flatten
  end

  def round
    return 1 if children.blank?
    1 + children.first.round
  end

#   alias_method :previous_games, :children
#   alias_method :game_for_winner, :parent
#   
#   belongs_to :player1, :class_name=>'Player'
#   belongs_to :player2, :class_name=>'Player'
#   
#   def self.final
#     self.root.children[0]
#   end
# 
#   def first_players_previous_game
#     self.children[0]
#   end
#   
#   def second_players_previous_game
#     self.children[1]
#   end
#   
#   def round
#     return 1 if first_players_previous_game.nil?
#     1 + first_players_previous_game.round
#   end
#   

  def ready_to_play?
    player1 and player2
  end
  
  def self.round_in_words(round)
    games_before_final = Game.final.round - round
    case games_before_final
    when -1
      'Champion'
    when 0
      'Finals'
    when 1
      'Semifinals'
    when 2
      'Quarterfinals'
    when 3
      'Round of 16'
    else
      "Round #{round.ordinalize}"
    end
  end
#   
#   def winner
#     # return nil if game_for_winner.nil?
#     game_for_winner.first_players_previous_game == self ? game_for_winner.player1 : game_for_winner.player2
#   end
#   def winner_id= player_id
#     # return nil if game_for_winner.nil?
#     if game_for_winner.first_players_previous_game == self 
#       game_for_winner.player1_id = player_id 
#     else
#       game_for_winner.player2_id = player_id
#     end
#     game_for_winner.save
#   end
#   
#   def self.first_round
#     find_leaves([final]).flatten
#   end
#   
# protected  
# 
#   def self.find_leaves roots
#     leaves = []
#     roots.each do |game|
#       if game.children.empty?
#         leaves << game
#       else
#         leaves << find_leaves(game.children)
#       end 
#     end
#     leaves
#   end
#   
end
