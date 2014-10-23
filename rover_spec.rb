require_relative './rover'

describe MissionControl do
  before :each do
    @test_input = "5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM"
    @mission_control = MissionControl.new
  end

  it "should output correct position of rovers for given input." do
    pending
    rover_control = MissionControl.new
    rover_control.execute_control_code @test_input
    rover_control.location.should be "1 3 N\n5 1 E\n"
  end

  it "should create two rovers" do
    @mission_control.execute_control_code @test_input
    @rovers = @mission_control.rovers
    expect(@rovers.count).to eq 2
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
    expect(@rover.direction).to eq 'N'
  end

  it "should rotate 90deg left given command left" do
    @rover.left
    expect(@rover.direction).to eq 'W'
    @rover.left
    expect(@rover.direction).to eq 'S'
    @rover.left
    expect(@rover.direction).to eq 'E'
    @rover.left
    expect(@rover.direction).to eq 'N'
  end

  it "should rotate 90deg right given command right" do
    @rover.right
    expect(@rover.direction).to eq 'E'
    @rover.right
    expect(@rover.direction).to eq 'S'
    @rover.right
    expect(@rover.direction).to eq 'W'
    @rover.right
    expect(@rover.direction).to eq 'N'
  end

  describe 'movement' do
    before :each do
      #
    end

    it "should move forward when direction is N" do
      @rover.direction = 'N'
      @rover.forward
      expect(@rover.x).to eq 1
      expect(@rover.y).to eq 3
    end

    it "should move forward when direction is E" do
      @rover.direction = 'E'
      @rover.forward
      expect(@rover.x).to eq 2
      expect(@rover.y).to eq 2
    end

    it "should move forward when direction is S" do
      @rover.direction = 'S'
      @rover.forward
      expect(@rover.x).to eq 1
      expect(@rover.y).to eq 1
    end

    it "should move forward when direction is W" do
      @rover.direction = 'W'
      @rover.forward
      expect(@rover.x).to eq 0
      expect(@rover.y).to eq 2
    end

  end
end
