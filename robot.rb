class Robot
  attr_reader :x, :y, :facing

  def place(x, y, facing)
    if (x > 0 && x <= 5 && y >0 && y <= 5)
      @x = x
      @y = y
      @facing = facing
    end
  end
end