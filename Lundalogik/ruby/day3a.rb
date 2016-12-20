list = File.readlines('day3_input.txt')
list = list.map do |x|
  x.strip
end

list = list.map do |x|
  x.gsub(/\s0/m, ' ').split(' ')
end

list = list.map do |x|
  x.sort_by(&:to_i)
end

i = 0

list.each do |x|
  if x[0].to_i + x[1].to_i > x[2].to_i
    i += 1
  end
end

puts i
