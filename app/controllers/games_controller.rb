class GamesController < ApplicationController
  # GET /Games
  # GET /Games.xml
  def index
    @championship_game = Game.final
  end

  # GET /Games/1/edit
  def edit
    @game = Game.find(params[:id])
  end


  # PUT /Games/1
  def update
    @game = Game.find(params[:id])

      if @game.update_attributes(params[:game])
        flash[:notice] = 'Game was successfully updated.'
        redirect_to(games_url) 
      else
        render :action => "edit" 
      end
  end

end
