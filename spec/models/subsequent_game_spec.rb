require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SubsequentGame do

  it 'should use the winners of the previous game as its players' do
    this_game = SubsequentGame.create!
    first_game = FirstGame.create!(:next_game_id=>this_game.id, :winner=>Player.create!(:name=>'Game 1 Winner'))
    second_game = FirstGame.create!(:next_game_id=>this_game.id, :winner=>Player.create!(:name=>'Game 2 Winner'))
    
    this_game.player1.should == first_game.winner
    this_game.player2.should == second_game.winner
  end
end
