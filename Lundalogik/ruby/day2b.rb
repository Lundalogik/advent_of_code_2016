list = File.readlines('day2_input.txt')
list = list.map{|x| x.strip}

keypad = [[0, 0, 1, 0, 0],
          [0, 2, 3, 4, 0],
          [5, 6, 7, 8, 9],
          [0, 'A', 'B', 'C', 0],
          [0, 0, 'D', 0, 0]]

numbers = []

x, y = 0, 2

list.each do |seq|
  seq.each_char do |dir|
    if dir == 'U'
      y -= 1 if y != 0 && keypad[y-1][x] != 0
    elsif dir == 'D'
      y += 1 if y != 4 && keypad[y+1][x] != 0
    elsif dir == 'R'
      x += 1 if x != 4 && keypad[y][x+1] != 0
    else
      x -= 1 if x != 0 && keypad[y][x-1] != 0
    end
  end

  numbers << keypad[y][x]
end

puts numbers.join
