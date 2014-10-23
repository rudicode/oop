require_relative './rover_lib'

mission_control = MissionControl.new

mission_control.set_plateau 5,5

mission_control.add_rover 1, 2, 'N','LMLMLMLMM'
mission_control.add_rover 3, 3, 'E','MMRMMRMRRM'

result = mission_control.start_rovers

puts result
