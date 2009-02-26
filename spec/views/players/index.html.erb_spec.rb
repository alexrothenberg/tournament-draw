require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/players/index.html.erb" do
  include PlayersHelper
  
  before(:each) do
    assigns[:players] = [
      stub_model(Player,
        :name => 'Alex'
      ),
      stub_model(Player,
        :name => 'John'
      )
    ]
  end

  it "should render list of players" do
    render "/players/index.html.erb"
    response.should have_tag("tr>td", 'Alex'.to_s, 2)
  end
end

