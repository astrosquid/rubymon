class Area

  @@areas = []

  attr_accessor :adj_areas

  DIRECTIONS = [:north, :east, :south, :west]

  def initialize(id, adj_areas={north: nil, east: nil, south: nil, west: nil})
    @id = id
    @adj_areas = adj_areas
    @@areas << self
  end

  # clockwise from north. 0 = north, 1 = east, etc.
  def set_adj_area(direction, adj_area)
    if DIRECTIONS.include? direction
      @adj_areas[direction] = adj_area
    end
  end
end
