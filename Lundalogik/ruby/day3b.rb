list = File.readlines('day3_input.txt')
list = list.map do |x|
  x.strip
end

list = list.map do |x|
  x.gsub(/\s0/m, ' ').split(' ')
end

i = 0

(0..list.length-3).step(3) do |x|
  triangle_1 = [list[x][0].to_i, list[x+1][0].to_i, list[x+2][0].to_i].sort
  triangle_2 = [list[x][1].to_i, list[x+1][1].to_i, list[x+2][1].to_i].sort
  triangle_3 = [list[x][2].to_i, list[x+1][2].to_i, list[x+2][2].to_i].sort

  if triangle_1[0] + triangle_1[1] > triangle_1[2]
    i += 1
  end

  if triangle_2[0] + triangle_2[1] > triangle_2[2]
    i += 1
  end

  if triangle_3[0] + triangle_3[1] > triangle_3[2]
    i += 1
  end
end

puts i
