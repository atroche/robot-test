class Table

  SIZE = 5

  def self.valid_position?(x, y)
    (0...SIZE).include?(x) && (0...SIZE).include?(y)
  end

end


class Robot
  attr_reader :x, :y, :facing

  DIRECTIONS = {
    north: {x: 0, y: 1},
    east: {x: 1, y: 0},
    south: {x: 0, y: -1},
    west: {x: -1, y: 0}
  }

  def valid_action?(x, y, facing)
    Table.valid_position?(x, y) && DIRECTIONS.keys.include?(facing)
  end

  def place(x, y, facing)
    if (valid_action?(x, y, facing))
      @x = x
      @y = y
      @facing = facing
    end
  end

  def move
    new_x = @x + DIRECTIONS[@facing][:x]
    new_y = @y + DIRECTIONS[@facing][:y]

    if (valid_action?(new_x, new_y, @facing))
      @x = new_x
      @y = new_y
    end
  end
end