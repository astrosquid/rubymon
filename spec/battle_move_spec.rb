require 'battle_move'

describe 'BattleMove' do

  describe '#new' do
    it 'is instantiated with a name' do
      tackle = BattleMove.new('Tackle')
      expect(tackle.name).to eq('Tackle')
    end

    it 'keeps a record of all moves in @@all' do
      expect(BattleMove.all.length).to eq(1)
    end
  end

  describe '.find_or_create_by_name' do
    it 'finds or creates a move by name maintaining uniqueness of objects by name property' do
      move_1 = BattleMove.new("Growl")
      move_2 = BattleMove.find_or_create_by_name("Growl")
      expect(move_1).to eq(move_2)
    end

    it 'does not increase the size of @@all' do
      expect(BattleMove.all.length).to eq(2)
    end
  end

end
