require_relative './rover'

describe RoverController do
  before :each do
    test_input = "5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM"
  end

  it "should output correct position of rovers for given input." do
    pending
    rover_control = RoverController.new
    rover_control.send_control_code test_input
    rover_control.location.should be "1 3 N\n5 1 E\n"
  end
end

describe Rover do

  before :each do
    @rover = Rover.new 1,2,'N'
  end


  it "should know it's location and direction" do
    @rover.x.should be 1
    @rover.y.should be 2
    @rover.direction.should eq 'N'
  end
  it "should rotate 90deg left given command left" do
    @rover.left
    @rover.direction.should eq 'W'
    @rover.left
    @rover.direction.should eq 'S'
    @rover.left
    @rover.direction.should eq 'E'
    @rover.left
    @rover.direction.should eq 'N'
  end
  it "should rotate 90deg right given command right" do
    @rover.right
    @rover.direction.should eq 'E'
    @rover.right
    @rover.direction.should eq 'S'
    @rover.right
    @rover.direction.should eq 'W'
    @rover.right
    @rover.direction.should eq 'N'
  end
end
