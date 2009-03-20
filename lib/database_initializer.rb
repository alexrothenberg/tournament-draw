class DatabaseInitializer
  def self.purge
    all_models.each do |model|
      begin
        model.respond_to?(:delete_all!) ? model.delete_all! : model.delete_all
      rescue
      end
    end
  end
  
  def self.create_tournament_from_names_file
    purge
    
    names = File.readlines(RAILS_ROOT + '/lib/names.txt').each { |line| line.chomp! }
    Tournament.create_draw names
  end

  # def self.populate_development
  #   purge
  #   
  #   player_names = (1..12).collect {|i| "Player #{i}" }
  #   Tournament.create_draw player_names
  #   
  #   
  #   #test not having power of 2 ... can we do byes?
  #   bye = Game.first_round.last
  #   other_bye = Game.first_round.last
  #   second_round_game = bye.game_for_winner
  #   second_round_game.update_attributes(:player2=>bye.player1)
  #   bye.player2.destroy
  #   bye.update_attributes(:player1=>nil, :player2=>nil)
  # end
  
  private
  
  def self.all_models
    load_models
    ActiveRecord::Base.send(:subclasses).select do |ar_subclass|
      ar_subclass.send(:subclasses).empty?
    end
  end
  
  def self.load_models
    models_dir = File.expand_path(File.dirname(__FILE__) + "/../app/models")
    Dir.glob("#{models_dir}/*.rb").each { |model_file| require model_file }
  end
  
end