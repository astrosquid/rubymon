class Prompt

  @@all = []

  def self.all
    @@all
  end

  def initialize(player)
    history = []
    @player = player
  end

  def prompt_user
    puts 'What now?'
    input = gets.chomp.split(' ')
  end

end
