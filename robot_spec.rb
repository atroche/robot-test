require 'minitest/autorun'
require "minitest/reporters"
load 'robot.rb'

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

describe Robot do
  it "can be instantiated" do
    @robot = Robot.new
  end
end