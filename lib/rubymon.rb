class Rubymon

  attr_reader :id, :species, :level, :types

  def initialize(id, species, level, types)
    @id = id
    @species = species
    @level = level
    @types = types
  end
end
