require_relative './rover_lib'

# sketching out MissionControl usage
# mission_control = MissionControl.new

# mission_control.set_plateau 5,5

# mission_control.add_rover 1, 2, 'N','LMLMLMLMM'
# mission_control.add_rover 3, 3, 'E','MMRMMRMRRM'

# results = mission_control.start_rovers

# results.each do |result|
#   puts result
# end

@rover = Rover.new 1,2,'N'
instructions = 'LMLMLMLMM'
instructions.each_char do |char|
  @rover.read_instruction char
end
puts @rover.position
