# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def result_pending(game)
    if game.player1 && game.player2
      link_to('---', edit_game_url(game))
    else
      '---' #need previous match winner before we can set here
    end
  end
end
