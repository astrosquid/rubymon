require 'pry'

class BattleMove

  @@all = []

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    bm = @@all.find do |move|
      move.name == name
    end

    unless bm
      bm = BattleMove.new(name)
    end

    bm
  end

  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self
  end
end
