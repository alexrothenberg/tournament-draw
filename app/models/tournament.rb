class Tournament
  
  def self.create_draw player_names
    create_games player_names.size
    populate_first_round_players player_names
  end

  def self.populate_first_round_players player_names
    Game.first_round.each do |game|
      player1 = next_player(player_names)
      player2 = next_player(player_names)
      game.update_attributes(:player1=>player1, :player2=>player2)
    end
  end

  def self.next_player(player_names)
    Player.create(:name=> (player_names.shift || 'Bye') )
  end
  
  def self.create_games number_of_players
    games_in_round = [Game.create] #the final
    while games_in_round.size < number_of_players
      games_in_previous_round = create_previous_round(games_in_round)
      games_in_round = games_in_previous_round
    end
    
  end
  
  def self.create_previous_round(games_in_round)
    games_in_previous_round = []
    games_in_round.each do |game|
      game.children = [Game.create, Game.create]
      games_in_previous_round << game.children
    end
    games_in_previous_round.flatten
  end
  
end
