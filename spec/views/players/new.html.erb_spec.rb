require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/players/new.html.erb" do
  include PlayersHelper
  
  before(:each) do
    assigns[:player] = stub_model(Player,
      :new_record? => true,
      :name => 'Alex'
    )
  end

  it "should render new form" do
    render "/players/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", players_path) do
      with_tag("input#player_name[name=?]", "player[name]")
    end
  end
end


