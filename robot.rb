class Robot
  attr_reader :x, :y, :facing

  DIRECTIONS = {
    north: {x: 0, y: 1},
    east: {x: 1, y: 0},
    south: {x: 0, y: -1},
    west: {x: -1, y: 0}
  }

  def place(x, y, facing)
    if (x >= 0 && x <= 4 &&
        y >= 0 && y <= 4 &&
        DIRECTIONS.keys.include?(facing))
      @x = x
      @y = y
      @facing = facing
    end
  end

  def move
    new_x = @x + DIRECTIONS[@facing][:x]
    new_y = @y + DIRECTIONS[@facing][:y]

    if (new_x >= 0 && new_x <= 4 &&
        new_y >= 0 && new_y <= 4 &&
        DIRECTIONS.keys.include?(facing))
      @x = new_x
      @y = new_y
    end
  end
end