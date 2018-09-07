require 'command_selector'
require 'command_go'
require 'player'

describe 'CommandSelector' do

  describe '.new' do
    it 'receives a command string and gives back the matching command object' do
      player = Player.new('route 1')
      go = CommandSelector.new('go north', player)
      expect(go).should be_kind_of(CommandGo)
    end
  end

  # describe 'properties' do
  #   area = Area.new(1)
  #   it 'by default creates a hash with 4 directions' do
  #     expect(area.adj_areas.length).to eq(4)
  #   end
  #
  #   it 'by default creates an empty with no adjacent areas' do
  #     expect(area.adj_areas[:east]).to eq(nil)
  #   end
  # end
  #
  # describe '#set_adj_area' do
  #   area = Area.new(1)
  #   area2 = Area.new(2)
  #   it 'can reassign specific rooms' do
  #     area.set_adj_area(:north, area2)
  #     expect(area.adj_areas[:north]).to eq(area2)
  #   end
  # end

end
