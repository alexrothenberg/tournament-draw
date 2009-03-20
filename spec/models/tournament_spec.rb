require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Tournament do

  it "should create a draw from a list of names" do
    Tournament.should_receive(:create_first_round).with(['player 1', 'player 2']).and_return([first_round_game=mock(:first_round_game_1)])
    Tournament.should_receive(:create_subsequent_rounds).with([first_round_game])
    
    Tournament.create_draw ['player 1', 'player 2']
  end
  
  it "should create the 1 first round game for a draw with 2 players" do
    first_round_games = Tournament.create_first_round(['Player 1', 'Player 2'])

    first_round_games.size.should == 1
    first_round_games.first.player1.name.should == 'Player 1'
    first_round_games.first.player2.name.should == 'Player 2'
  end
  
  it "should create the 8 first round game for a draw with 16 players" do
    first_round_games = Tournament.create_first_round((1..16).collect {|i| "Player #{i}"})

    first_round_games.size.should == 8
    first_round_games.first.player1.name.should == 'Player 1'
    first_round_games.last.player2.name.should == 'Player 16'
  end
  
  it 'should create a final given the semis' do
    semifinal_games = [mock_game_1=mock(:game1, :id=>123), mock_game_2=mock(:game2, :id=>456)]
    SubsequentGame.should_receive(:create!).with(:child_ids=>[123, 456])
    
    Tournament.create_subsequent_rounds semifinal_games
  end
  
  it 'should create the semis and finals given the quarterfinals' do
    quarterfinal_games = [mock(:game111, :id=>111), mock(:game222, :id=>222), mock(:game333, :id=>333), mock(:game444, :id=>444)]
    SubsequentGame.should_receive(:create!).with(:child_ids=>[111, 222]).and_return(mock(:game888, :id=>888))
    SubsequentGame.should_receive(:create!).with(:child_ids=>[333, 444]).and_return(mock(:game999, :id=>999))
    SubsequentGame.should_receive(:create!).with(:child_ids=>[888, 999])
    
    Tournament.create_subsequent_rounds quarterfinal_games
  end
  
  it 'should create a draw with 3 rounds (no mocking)' do
    Tournament.create_draw ['player 1', 'player 2', 'player 3', 'player 4']
  end
  
  
  
end
