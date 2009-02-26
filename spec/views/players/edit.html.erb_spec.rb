require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/players/edit.html.erb" do
  include PlayersHelper
  
  before(:each) do
    assigns[:player] = @player = stub_model(Player,
      :new_record? => false,
      :name => 'Alex'
    )
  end

  it "should render edit form" do
    render "/players/edit.html.erb"
    
    response.should have_tag("form[action=#{player_path(@player)}][method=post]") do
      with_tag('input#player_name[name=?]', "player[name]")
    end
  end
end


