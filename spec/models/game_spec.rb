require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Game do

  it "should have a winner" do
    player = Player.create!(:name=>'Player 1')
    game = Game.create!(:winner=>player)
    game.winner_id.should == player.id
  end
  
  it 'should be organized into a tournament tree' do
    championship_game = Game.create!()
    semifinal_game1 = Game.create!(:next_game_id=>championship_game.id)
    semifinal_game2 = Game.create!(:next_game_id=>championship_game.id)
    
    Game.final.should == championship_game
    semifinal_game1.next_game.should == championship_game
    semifinal_game2.next_game.should == championship_game
  end
end
