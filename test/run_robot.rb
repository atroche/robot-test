load 'lib/robot.rb'

robot = Robot.new

commands = File.read('test.data').split("\n")

commands.each do |command|
  instruction, args = command.split

  case instruction
  when "PLACE"
    x, y, direction = args.split(',')
    robot.place(x.to_i, y.to_i, direction.downcase.to_sym)
  when "MOVE"
    robot.move
  when "LEFT"
    robot.turn :left
  when "RIGHT"
    robot.turn :right
  when "REPORT"
    puts "#{robot.x},#{robot.y},#{robot.facing.upcase}"
  end
end