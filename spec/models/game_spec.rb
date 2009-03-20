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
  
  it 'should get games by round' do
    second_round_game = Game.create!()
    first_round_game_1 = Game.create!(:next_game_id=>second_round_game.id)
    first_round_game_2 = Game.create!(:next_game_id=>second_round_game.id)

    games_by_round = Game.find_and_collect_by_round
    
    games_by_round[1].should include(first_round_game_1, first_round_game_2)
    games_by_round[2].should include(second_round_game)
  end
  
end
