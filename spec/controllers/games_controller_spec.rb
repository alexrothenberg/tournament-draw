require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GamesController do

  def mock_game(stubs={})
    @mock_game ||= mock_model(Game, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all games as @games" do
      Game.should_receive(:find_and_collect_by_round).and_return(games_by_round={1=>[mock_game, mock_game], 2=>[mock_game]})
      get :index
      assigns[:games_by_round].should == games_by_round
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested game as @game" do
      Game.should_receive(:find).with("37").and_return(mock_game)
      get :edit, :id => "37"
      assigns[:game].should equal(mock_game)
    end

  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested game" do
        Game.should_receive(:find).with("37").and_return(mock_game)
        mock_game.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :game => {:these => 'params'}
      end

      it "should expose the requested game as @game" do
        Game.stub!(:find).and_return(mock_game(:update_attributes => true))
        put :update, :id => "1"
        assigns(:game).should equal(mock_game)
      end

      it "should redirect to the game" do
        Game.stub!(:find).and_return(mock_game(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(games_url)
      end

    end
    
    describe "with invalid params" do

      it "should update the requested game" do
        Game.should_receive(:find).with("37").and_return(mock_game)
        mock_game.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :game => {:these => 'params'}
      end

      it "should expose the game as @game" do
        Game.stub!(:find).and_return(mock_game(:update_attributes => false))
        put :update, :id => "1"
        assigns(:game).should equal(mock_game)
      end

      it "should re-render the 'edit' template" do
        Game.stub!(:find).and_return(mock_game(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

end
