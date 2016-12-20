list = File.readlines('day2_input.txt')
list = list.map{|x| x.strip}

keypad = [[1, 2, 3],
          [4, 5, 6],
          [7, 8, 9]]

numbers = []

x, y = 1, 1

list.each do |seq|
  seq.each_char do |dir|
    if dir == 'U'
      y -= 1 if y != 0
    elsif dir == 'D'
      y += 1 if y != 2
    elsif dir == 'R'
      x += 1 if x != 2
    else
      x -= 1 if x != 0
    end
  end

  numbers << keypad[y][x]
end

puts numbers.join
