# automaton_spec.rb
require_relative 'robot_mock'

describe Automaton, "#automaton" do
  it "should handle init state properly" do
    robot = Robot.new 0
    expect(robot.current_state).to eq(:increase)
  end

  it "should do transitions" do
    robot = Robot.new 0
    100.times do
      robot.move
    end
    expect(robot.current_state).to eq(:increase)
    robot.move
    expect(robot.current_state).to eq(:decrease)
  end

  it "should do behave as specified" do
    robot = Robot.new 0
    robot.move
    expect(robot.n).to eq(1)
    100.times do
      robot.move
    end
    expect(robot.n).to eq(101)
    101.times do
      robot.move
    end
    expect(robot.n).to eq(0)
    100.times do
      robot.move
    end
    expect(robot.n).to eq(-100)
  end
end

