require 'minitest/autorun'
require "minitest/reporters"
load 'robot.rb'

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

describe Robot do
  before do
    @robot = Robot.new
  end

  describe "#place" do
    describe "when the specified position is on the table" do
      it "sets the x, y and facing of the robot" do
        @robot.place(1, 2, :north)

        @robot.x.must_equal 1
        @robot.y.must_equal 2
        @robot.facing.must_equal :north
      end
    end

    describe "when the specified position is not on the table" do
      it "doesn't change the x, y and facing of the robot" do
        @robot.place(1, 2, :north)

        @robot.place(1, 6, :south)
        @robot.place(-1, 3, :south)
        @robot.place(6, 3, :south)
        @robot.place(6, -1, :south)

        @robot.x.must_equal 1
        @robot.y.must_equal 2
        @robot.facing.must_equal :north
      end
    end
  end
end