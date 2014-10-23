#
class Rover
  attr_reader :x, :y
  attr_accessor :direction

  def initialize x_coordinate, y_coordinate, direction
    @x = x_coordinate
    @y = y_coordinate
    @direction_sequence = ['N','E','S','W']
    @direction = direction
  end

  def position
    "#{@x} #{@y} #{@direction}"
  end

  def left
    index = @direction_sequence.index @direction
    index = @direction_sequence.count if index == 0
    index -= 1
    @direction = @direction_sequence[index]
  end

  def right
    index = @direction_sequence.index @direction
    index += 1
    index = 0 if index >= @direction_sequence.count
    @direction = @direction_sequence[index]
  end

  def forward
    case @direction
    when 'N'
      @y += 1
    when 'E'
      @x += 1
    when 'W'
      @x -= 1
    when 'S'
      @y -= 1
    end
  end

  def read_instruction instruction
    case instruction
    when 'L'
      left
    when 'R'
      right
    when 'F'
      forward
    end
  end
end

class MissionControl
  def initialize
    @rovers = []
  end

  def rovers_count
    @rovers.count
  end

end

