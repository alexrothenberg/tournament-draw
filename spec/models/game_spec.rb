require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Game do
  before(:each) do
    @valid_attributes = {
      :player1_id => 1,
      :player2_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Game.create!(@valid_attributes)
  end
end
