class Robot
  attr_reader :x, :y, :facing

  POSSIBLE_DIRECTIONS = [:north, :south, :east, :west]

  def place(x, y, facing)
    if (x > 0 && x <= 5 &&
        y > 0 && y <= 5 &&
        POSSIBLE_DIRECTIONS.include?(facing))
      @x = x
      @y = y
      @facing = facing
    end
  end

  def move
    if @facing == :north
      @y += 1
    end
  end
end