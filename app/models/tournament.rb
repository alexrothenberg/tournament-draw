class Tournament
  
  def self.create_draw player_names
    first_round_games = create_first_round player_names
    create_subsequent_rounds first_round_games
  end

  def self.create_first_round player_names
    first_round_games = []
    0.upto(player_names.size/2 - 1) do |index|
      first_player = Player.create!(:name=>player_names[2*index])
      second_player = Player.create!(:name=>player_names[2*index+1])
      first_round_games << FirstGame.create!(:player1=>first_player, :player2=>second_player)
    end
    first_round_games
  end

  def self.create_subsequent_rounds previous_round_games
    size_of_round = previous_round_games.size/2 
    next_round = (1..size_of_round).collect do |index|
      first_game = previous_round_games[2*(index-1)]
      second_game = previous_round_games[2*(index-1)+1]
      SubsequentGame.create!(:child_ids=>[first_game.id, second_game.id])
    end
    create_subsequent_rounds next_round unless next_round.size == 1
  end

  # def self.next_player(player_names)
  #   Player.create(:name=> (player_names.shift || 'Bye') )
  # end
  # 
  # def self.create_games_in_draw number_of_players, games_in_round=[create_final]
  #   games_in_round = [Game.create] #the final
  #   
  #   while games_in_round.size < number_of_players
  #     games_in_previous_round = create_previous_round(games_in_round)
  #     games_in_round = games_in_previous_round
  #   end
  #   
  # end
  # 
  # def self.create_previous_round(games_in_round)
  #   games_in_previous_round = []
  #   games_in_round.each do |game|
  #     game.children = [Game.create, Game.create]
  #     games_in_previous_round << game.children
  #   end
  #   games_in_previous_round.flatten
  # end
  # 
end
