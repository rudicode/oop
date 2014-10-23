#
class RoverController
end

class Rover
  attr_reader :x, :y, :direction
  def initialize x_coordinate, y_coordinate, direction
    @x = x_coordinate
    @y = y_coordinate
    @direction_sequence = ['N','E','S','W']
    @direction = direction
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


end
