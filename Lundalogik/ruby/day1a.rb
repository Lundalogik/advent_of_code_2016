ns = 0
ew = 0

list = File.read('day1_input.txt')
list = list.split(',').map{|x| x.strip}

turn_direction = 0 # north

list.each do |command|
  direction = command[0]
  distance = command.slice(1, command.length)

  if direction == 'R'
    turn_direction -= 1
  else
    turn_direction += 1
  end

  turn_direction = turn_direction % 4

  if turn_direction % 2 == 0
    ns += (turn_direction - 1) * distance.to_i
  else
    ew += (turn_direction - 2) * distance.to_i
  end
end

puts ns.abs + ew.abs
