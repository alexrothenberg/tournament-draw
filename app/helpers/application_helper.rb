# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def show_first_player_in_game(game)
    show_player_in_game(game, game.player1, game.children[0])
  end

  def show_second_player_in_game(game)
    show_player_in_game(game, game.player2, game.children[1])
  end

private
  def show_player_in_game(game, player, previous_game)
    if player
      player.name
    elsif previous_game.ready_to_play?
      link_to('---', edit_game_url(previous_game))
    else
      '---' #need previous match winner before we can set here
    end
  end

end
