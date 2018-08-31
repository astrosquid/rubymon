require 'character'

describe 'Character' do 

  describe 'properties' do 
    it 'always has a name and id' do
      oak = Character.new(1, 'Professor Oak')
      expect(oak.name).to eq('Professor Oak')
    end 
  end 
end
