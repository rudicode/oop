require_relative './rover_lib'

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
    pending
    @mission_control.execute_control_code @test_input
    @rovers = @mission_control.rovers
    expect(@mission_control.rovers_count).to eq 2
  end

end

describe Rover do

  before :each do
    @rover = Rover.new 1,2,'N'
  end


  it "should know it's position and direction" do
    position = @rover.position
    expect(position).to eq '1 2 N'
  end

  describe "commands" do

    it "should execute command L" do
      @rover.read_instruction 'L'
      expect(@rover.direction).to eq 'W'
    end

    it "should execute command R" do
      @rover.read_instruction 'R'
      expect(@rover.direction).to eq 'E'
    end

    it "should execute command M" do
      @rover.read_instruction 'M'
      expect(@rover.x).to eq 1
      expect(@rover.y).to eq 3
    end

  end

  describe "rotation" do

    it "should rotate 360deg given instructions LLLL" do
      @rover.read_instruction 'L'
      expect(@rover.direction).to eq 'W'

      @rover.read_instruction 'L'
      expect(@rover.direction).to eq 'S'

      @rover.read_instruction 'L'
      expect(@rover.direction).to eq 'E'

      @rover.read_instruction 'L'
      expect(@rover.direction).to eq 'N'
    end

    it "should rotate 360deg given instructions RRRR" do
      @rover.read_instruction 'R'
      expect(@rover.direction).to eq 'E'

      @rover.read_instruction 'R'
      expect(@rover.direction).to eq 'S'

      @rover.read_instruction 'R'
      expect(@rover.direction).to eq 'W'

      @rover.read_instruction 'R'
      expect(@rover.direction).to eq 'N'
    end
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
