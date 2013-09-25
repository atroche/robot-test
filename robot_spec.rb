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
      before do
        @new_x = 1
        @new_y = 2
      end

      it "sets the x, y and facing of the robot" do
        @robot.place(@new_x, @new_y, :north)

        @robot.x.must_equal @new_x
        @robot.y.must_equal @new_y
        @robot.facing.must_equal :north
      end

      describe "but the supplied direction isn't one of the cardinal four" do
        before do
          @facing = :northeast
        end

        it "doesn't change the robot" do
          @robot.place(@new_x, @new_y, @facing)

          @robot.x.wont_equal @new_x
          @robot.y.wont_equal @new_y
          @robot.facing.wont_equal @facing
        end
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

  describe "#move" do
    Robot::DIRECTIONS.each do |direction, movement|
      it "moves the robot #{direction} when facing #{direction}" do
        @robot.place(1, 1, direction)
        old_x = @robot.x
        old_y = @robot.y

        @robot.move

        @robot.x.must_equal(old_x + movement[:x])
        @robot.y.must_equal(old_y + movement[:y])
      end
    end

    it "doesn't change the direction of the robot" do
      @robot.place(1, 1, :north)
      @robot.move

      @robot.facing.must_equal :north
    end
  end
end