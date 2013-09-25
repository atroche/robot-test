require 'minitest/autorun'

load 'robot.rb'

describe Robot do
  it "can be instantiated" do
    @robot = Robot.new
  end
end