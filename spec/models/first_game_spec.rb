require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FirstGame do

  it "should have 2 players" do
    first_player = Player.create!(:name=>'Player 1')
    second_player = Player.create!(:name=>'Player 2')
    game = FirstGame.create!(:player1=>first_player, :player2=>second_player)
    game.player1_id.should == first_player.id
    game.player2_id.should == second_player.id
  end
  
  it "should let you set one of the two players as a winner" do
    first_player = Player.create!(:name=>'Player 1')
    second_player = Player.create!(:name=>'Player 2')
    game = FirstGame.create!(:player1=>first_player, :player2=>second_player)
    game.winner = first_player
    game.save
    Game.find(game.id).winner.should == first_player
  end
  
end
