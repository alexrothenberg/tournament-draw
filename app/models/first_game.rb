class FirstGame < Game
  
  belongs_to :player1, :class_name=>'Player'
  belongs_to :player2, :class_name=>'Player'
  
end
