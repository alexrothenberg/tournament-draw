class SubsequentGame < Game
  
  def player1
    self.children[0].winner
  end

  def player2
    self.children[1].winner
  end
end
