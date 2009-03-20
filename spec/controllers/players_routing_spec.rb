require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PlayersController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "players", :action => "index").should == "/players"
    end
  
    it "should map #new" do
      route_for(:controller => "players", :action => "new").should == "/players/new"
    end
  
    it "should map #show" do
      route_for(:controller => "players", :action => "show", :id => '1').should == "/players/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "players", :action => "edit", :id => '1').should == "/players/1/edit"
    end
  
    # it "should map #update" do
    #   route_for(:controller => "players", :action => "update", :id => '1').should == "/players/1"
    # end
    #   
    # it "should map #destroy" do
    #   route_for(:controller => "players", :action => "destroy", :id => '1').should == "/players/1"
    # end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/players").should == {:controller => "players", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/players/new").should == {:controller => "players", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/players").should == {:controller => "players", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/players/1").should == {:controller => "players", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/players/1/edit").should == {:controller => "players", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/players/1").should == {:controller => "players", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/players/1").should == {:controller => "players", :action => "destroy", :id => "1"}
    end
  end
end
