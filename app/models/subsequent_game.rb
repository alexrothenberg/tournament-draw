class SubsequentGame < Game
  
  def player1_id
    self.children[0].winner_id
  end
  def player1
    self.children[0].winner
  end

  def player2_id
    self.children[1].winner_id
  end
  def player2
    self.children[1].winner
  end
end
