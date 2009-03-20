# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def show_winner(game)
    if game.winner
      game.winner.name
    else
    # elsif game.ready_to_play?
      link_to('---', edit_game_url(game))
    #   '---' #need previous match winner before we can set here
    end
  end
end
