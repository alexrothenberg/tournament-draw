require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GamesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "games", :action => "index").should == "/games"
    end
  
    it "should map #new" do
      route_for(:controller => "games", :action => "new").should == "/games/new"
    end
  
    it "should map #show" do
      route_for(:controller => "games", :action => "show", :id => '1').should == "/games/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "games", :action => "edit", :id => '1').should == "/games/1/edit"
    end
  
    # it "should map #update" do
    #   route_for(:controller => "games", :action => "update", :id => '1').should == "/games/1"
    # end
    #   
    # it "should map #destroy" do
    #   route_for(:controller => "games", :action => "destroy", :id => '1').should == "/games/1"
    # end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/games").should == {:controller => "games", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/games/new").should == {:controller => "games", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/games").should == {:controller => "games", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/games/1").should == {:controller => "games", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/games/1/edit").should == {:controller => "games", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/games/1").should == {:controller => "games", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/games/1").should == {:controller => "games", :action => "destroy", :id => "1"}
    end
  end
end
