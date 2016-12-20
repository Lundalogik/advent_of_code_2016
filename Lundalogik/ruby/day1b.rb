ns = 0
ew = 0

list = File.read('day1_input.txt')
list = list.split(',').map{|x| x.strip}

turn_direction = 0 # north

previous_locations = [[0, 0]]

list.each do |command|
  do_break = false

  direction = command[0]
  distance = command.slice(1, command.length)

  if direction == 'R'
    turn_direction -= 1
  else
    turn_direction += 1
  end

  turn_direction = turn_direction % 4

  i = 0

  begin
    if turn_direction % 2 == 0
      ns += (turn_direction - 1)
    else
      ew += (turn_direction - 2)
    end

    if previous_locations.include? [ns, ew]
      do_break = true
      break
    end

    previous_locations << [ns, ew]

    i += 1
  end while i < distance.to_i

  break if do_break
end

puts ns.abs + ew.abs
