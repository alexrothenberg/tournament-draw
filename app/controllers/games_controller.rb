class GamesController < ApplicationController
  # GET /Games
  # GET /Games.xml
  def index
    @games_by_round = Game.find_and_collect_by_round
  end

  # GET /Games/1/edit
  def edit
    @game = Game.find(params[:id])
  end


  # PUT /Games/1
  def update
    @game = Game.find(params[:id])

    game_params = params[:first_game] || params[:subsequent_game]
    if @game.update_attributes(game_params)
      flash[:notice] = 'Game was successfully updated.'
      redirect_to(games_url) 
    else
      render :action => "edit" 
    end
  end

end
