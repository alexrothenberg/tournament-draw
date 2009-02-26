require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PlayersController do

  def mock_player(stubs={})
    @mock_player ||= mock_model(Player, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all players as @players" do
      Player.should_receive(:find).with(:all).and_return([mock_player])
      get :index
      assigns[:players].should == [mock_player]
    end

    describe "with mime type of xml" do
  
      it "should render all players as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Player.should_receive(:find).with(:all).and_return(players = mock("Array of Players"))
        players.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested player as @player" do
      Player.should_receive(:find).with("37").and_return(mock_player)
      get :show, :id => "37"
      assigns[:player].should equal(mock_player)
    end
    
    describe "with mime type of xml" do

      it "should render the requested player as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Player.should_receive(:find).with("37").and_return(mock_player)
        mock_player.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new player as @player" do
      Player.should_receive(:new).and_return(mock_player)
      get :new
      assigns[:player].should equal(mock_player)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested player as @player" do
      Player.should_receive(:find).with("37").and_return(mock_player)
      get :edit, :id => "37"
      assigns[:player].should equal(mock_player)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created player as @player" do
        Player.should_receive(:new).with({'these' => 'params'}).and_return(mock_player(:save => true))
        post :create, :player => {:these => 'params'}
        assigns(:player).should equal(mock_player)
      end

      it "should redirect to the created player" do
        Player.stub!(:new).and_return(mock_player(:save => true))
        post :create, :player => {}
        response.should redirect_to(player_url(mock_player))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved player as @player" do
        Player.stub!(:new).with({'these' => 'params'}).and_return(mock_player(:save => false))
        post :create, :player => {:these => 'params'}
        assigns(:player).should equal(mock_player)
      end

      it "should re-render the 'new' template" do
        Player.stub!(:new).and_return(mock_player(:save => false))
        post :create, :player => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested player" do
        Player.should_receive(:find).with("37").and_return(mock_player)
        mock_player.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :player => {:these => 'params'}
      end

      it "should expose the requested player as @player" do
        Player.stub!(:find).and_return(mock_player(:update_attributes => true))
        put :update, :id => "1"
        assigns(:player).should equal(mock_player)
      end

      it "should redirect to the player" do
        Player.stub!(:find).and_return(mock_player(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(player_url(mock_player))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested player" do
        Player.should_receive(:find).with("37").and_return(mock_player)
        mock_player.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :player => {:these => 'params'}
      end

      it "should expose the player as @player" do
        Player.stub!(:find).and_return(mock_player(:update_attributes => false))
        put :update, :id => "1"
        assigns(:player).should equal(mock_player)
      end

      it "should re-render the 'edit' template" do
        Player.stub!(:find).and_return(mock_player(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested player" do
      Player.should_receive(:find).with("37").and_return(mock_player)
      mock_player.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the players list" do
      Player.stub!(:find).and_return(mock_player(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(players_url)
    end

  end

end
