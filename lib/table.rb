class Table
  SIZE = 5

  def self.valid_position?(x, y)
    (0...SIZE).include?(x) && (0...SIZE).include?(y)
  end
end