class Robot
  attr_reader :x, :y, :facing

  DIRECTIONS = {
    north: {x: 0, y: 1},
    east: {x: 1, y: 0},
    south: {x: 0, y: -1},
    west: {x: -1, y: 0}
  }

  def place(x, y, facing)
    if (x > 0 && x <= 5 &&
        y > 0 && y <= 5 &&
        DIRECTIONS.keys.include?(facing))
      @x = x
      @y = y
      @facing = facing
    end
  end

  def move
    @x += DIRECTIONS[@facing][:x]
    @y += DIRECTIONS[@facing][:y]
  end
end