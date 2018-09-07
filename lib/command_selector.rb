class CommandSelector

  COMMANDS = ['go']

  @@all = []

  def self.all
    @@all
  end

  attr_reader :command, :args

  def initialize
    # @command_title = command_title
    # @args = args
    # command = self.make_command
    @@all << self
  end

  def make_command(command_title, player, *args)
    # inadvertantly validates command
    pp command_title
    pp player
    pp args
    puts ''
    
    case command_title
    when 'go'
      CommandGo.new(args[0], player.location)
    else
      CommandInvalid.new
    end
  end

end
