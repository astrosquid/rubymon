require_relative '../lib/prompt'
require_relative '../lib/command_selector'
require_relative '../lib/command_go'
require_relative '../lib/player'

require 'pry'
require 'pp'

cs = CommandSelector.new
pl = Player.new('rt 1')
pr = Prompt.new(pl)

while true do
  # binding.pry
  input = pr.prompt_user
  command = cs.make_command(input.shift, pl, input)
end
